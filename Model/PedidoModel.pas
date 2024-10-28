{*
 *
 * Autor: Vagner de Souza Rosa
 * Data de Criação:28/10/2024
 * Última Modificação: [Data da Última Modificação]
 *
 * Observações:
 * - Teste TeCcnico WK Delphi.
 *
 * Versão: 1.0
 *}
unit PedidoModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, System.Generics.Collections,
  ProdutoModel,Model.Connection;

type
  TPedido = class
  public
    NumeroPedido: Integer;
    DataEmissao: TDateTime;
    CodigoCliente: Integer;
    ValorTotal: Double;
  end;

  TPedidoProduto = class
  public
    ID: Integer;
    NumeroPedido: Integer;
    CodigoProduto: Integer;
    Quantidade: Integer;
    VirUnitario: Double;
    VirTotal: Double;
  end;

  TPedidoModel = class
  private
    FConnection: TFDConnection;
  public
    constructor Create;
    destructor  Destroy;
    function GravarPedido(CodigoCliente: Integer; PedidoProduto: TList<TPedidoProduto>): Boolean; // Método para gravar pedido
    function BuscarPedido(NumeroPedido: Integer; out Pedido: TPedido; out Produtos: TList<TPedidoProduto>): Boolean; // Método para buscar pedido
  end;


implementation

uses uDM;

constructor TPedidoModel.Create;
begin
 Model.Connection.Connect;
end;

destructor TPedidoModel.Destroy;
begin
    Model.Connection.Disconect;
end;

function TPedidoModel.GravarPedido(CodigoCliente: Integer; PedidoProduto: TList<TPedidoProduto>): Boolean;
var
  PedidoNumero: Integer;
  ValorTotal: Double;
  i: Integer;
  Query: TFDQuery;
begin
  Result := False;
  ValorTotal := 0;
  // Calcula o valor total dos produtos
  for i := 0 to PedidoProduto.Count - 1 do
  begin
    ValorTotal := ValorTotal + PedidoProduto[i].VirTotal;
  end;
  // Inicia uma transação
  Model.Connection.FConnection.StartTransaction;
  try
    // Gravar dados do pedido na tabela 'pedidos'
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Model.Connection.FConnection;
      Query.SQL.Text := 'INSERT INTO pedidos (data_emissao, codigo_cliente, valor_total) VALUES (NOW(), :codigo_cliente, :valor_total)';
      Query.ParamByName('codigo_cliente').AsInteger := CodigoCliente;
      Query.ParamByName('valor_total').AsFloat := ValorTotal;
      Query.ExecSQL;
      // Recupera o número do pedido recém-criado
      Query.SQL.Text := 'SELECT LAST_INSERT_ID()';
      Query.Open;
      PedidoNumero := Query.Fields[0].AsInteger;
      // Gravar produtos na tabela 'pedidos_produtos'
      for i := 0 to PedidoProduto.Count - 1 do
      begin
        Query.SQL.Text := 'INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES (:numero_pedido, :codigo_produto, :quantidade, :vir_unitario, :vir_total)';
        Query.ParamByName('numero_pedido').AsInteger := PedidoNumero;
        Query.ParamByName('codigo_produto').AsInteger := PedidoProduto[i].CodigoProduto;
        Query.ParamByName('quantidade').AsInteger := PedidoProduto[i].Quantidade;
        Query.ParamByName('vir_unitario').AsFloat := PedidoProduto[i].VirUnitario;
        Query.ParamByName('vir_total').AsFloat := PedidoProduto[i].VirTotal;
        Query.ExecSQL;
      end;
      // Confirma a transação
      Model.Connection.FConnection.Commit;
      Result := True;
    finally
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      // Desfaz a transação em caso de erro
      FConnection.Rollback;
      raise; // Repassa a exceção
    end;
  end;
end;

function TPedidoModel.BuscarPedido(NumeroPedido: Integer; out Pedido: TPedido; out Produtos: TList<TPedidoProduto>): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Pedido := nil;
  Produtos := TList<TPedidoProduto>.Create;
  // Inicia a busca
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Model.Connection.FConnection;
    // Busca o pedido
    Query.SQL.Text := 'SELECT * FROM pedidos WHERE numero_pedido = :numero_pedido';
    Query.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Pedido := TPedido.Create;
      Pedido.NumeroPedido := Query.FieldByName('numero_pedido').AsInteger;
      Pedido.DataEmissao := Query.FieldByName('data_emissao').AsDateTime;
      Pedido.CodigoCliente := Query.FieldByName('codigo_cliente').AsInteger;
      Pedido.ValorTotal := Query.FieldByName('valor_total').AsFloat;
      // Busca os produtos associados
      Query.SQL.Text := 'SELECT * FROM pedidos_produtos WHERE numero_pedido = :numero_pedido';
      Query.ParamByName('numero_pedido').AsInteger := Pedido.NumeroPedido;
      Query.Open;
      while not Query.Eof do
      begin
        var Produto := TPedidoProduto.Create;
        Produto.ID := Query.FieldByName('id').AsInteger;
        Produto.NumeroPedido := Query.FieldByName('numero_pedido').AsInteger;
        Produto.CodigoProduto := Query.FieldByName('codigo_produto').AsInteger;
        Produto.Quantidade := Query.FieldByName('quantidade').AsInteger;
        Produto.VirUnitario := Query.FieldByName('vir_unitario').AsFloat;
        Produto.VirTotal := Query.FieldByName('vir_total').AsFloat;
        Produtos.Add(Produto);
        Query.Next;
      end;
      Result := True; // Pedido encontrado
    end;
  finally
    Query.Free;
  end;
end;



end.

