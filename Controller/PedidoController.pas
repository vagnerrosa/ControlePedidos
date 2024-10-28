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
unit PedidoController;

interface

uses
  System.SysUtils, System.Generics.Collections, PedidoModel, Data.DB, FireDAC.Comp.Client;

type
  TPedidoController = class
  private
    FModel: TPedidoModel;
  public
    constructor Create;
    destructor Destroy; override;
    function GravarPedido(mtbPedido: TFDMemTable; mtbPedidoItem: TFDMemTable): Boolean;
    function BuscarPedido(NumeroPedido: Integer; out Pedido: TPedido; out Produtos: TList<TPedidoProduto>): Boolean;

  end;

implementation

constructor TPedidoController.Create;
begin
  FModel := TPedidoModel.Create;
end;

destructor TPedidoController.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TPedidoController.GravarPedido(mtbPedido: TFDMemTable; mtbPedidoItem: TFDMemTable): Boolean;
var
  CodigoCliente: Integer;
  PedidoProdutoList: TList<TPedidoProduto>;
  Produto: TPedidoProduto;
begin
  Result := False;

  // Obtemos o código do cliente do mtbPedido
  CodigoCliente := mtbPedido.FieldByName('codigo_cliente').AsInteger;

  // Cria uma lista de produtos do pedido
  PedidoProdutoList := TList<TPedidoProduto>.Create;
  try
    mtbPedidoItem.First; // Move para o primeiro item
    while not mtbPedidoItem.Eof do
    begin
      Produto := TPedidoProduto.Create;
      try
        Produto.CodigoProduto := mtbPedidoItem.FieldByName('codigo_produto').AsInteger;
        Produto.Quantidade := mtbPedidoItem.FieldByName('quantidade').AsInteger;
        Produto.VirUnitario := mtbPedidoItem.FieldByName('vir_unitario').AsFloat;
        Produto.VirTotal := mtbPedidoItem.FieldByName('vir_total').AsFloat;

        PedidoProdutoList.Add(Produto);
      except
        Produto.Free; // Libera o objeto se ocorrer um erro
        raise;
      end;
      mtbPedidoItem.Next; // Move para o próximo item
    end;

    // Chama o método do modelo para gravar o pedido e os produtos
    Result := FModel.GravarPedido(CodigoCliente, PedidoProdutoList);
  finally
    PedidoProdutoList.Free; // Libera a lista de produtos
  end;
end;

function TPedidoController.BuscarPedido(NumeroPedido: Integer; out Pedido: TPedido; out Produtos: TList<TPedidoProduto>): Boolean;
begin
  Result := FModel.BuscarPedido(NumeroPedido, Pedido, Produtos);
end;


end.

