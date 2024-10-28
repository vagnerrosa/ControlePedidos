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
unit ProdutoModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Model.Connection;

type
  TProduto = class
  public
    Codigo: Integer;
    Descricao: string;
    PrecoVenda: Double;
  end;

  TProdutoModel = class
  private
    FConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy;
    function ConsultarProduto(ACodigo: Integer; out ADescricao: string; out APrecoVenda: Double): Boolean;
  end;

implementation

constructor TProdutoModel.Create;
begin
  Model.Connection.Connect;
end;

destructor TProdutoModel.Destroy;
begin
    Model.Connection.Disconect;
end;

function TProdutoModel.ConsultarProduto(ACodigo: Integer; out ADescricao: string; out APrecoVenda: Double): Boolean;
var
  Query: TFDQuery;
begin
  Result := False; // Inicializa como não encontrado
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Model.Connection.FConnection;
    Query.SQL.Text := 'SELECT descricao, preco_venda FROM produtos WHERE codigo = :codigo';
    Query.ParamByName('codigo').AsInteger := ACodigo;
    Query.Open;

    if not Query.IsEmpty then
    begin
      ADescricao := Query.FieldByName('descricao').AsString;
      APrecoVenda := Query.FieldByName('preco_venda').AsFloat;
      Result := True; // Produto encontrado
    end;
  finally
    Query.Free;
  end;
end;

end.

