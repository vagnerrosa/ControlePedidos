{*
 *
 * Autor: Vagner de Souza Rosa
 * Data de Cria��o:28/10/2024
 * �ltima Modifica��o: [Data da �ltima Modifica��o]
 *
 * Observa��es:
 * - Teste TeCcnico WK Delphi.
 *
 * Vers�o: 1.0
 *}
unit ProdutoController;

interface

uses
  ProdutoModel;

type
  TProdutoController = class
  private
    FModel: TProdutoModel;
  public
    constructor Create;
    destructor Destroy; override;
    function ConsultarProduto(ACodigo: Integer; out ADescricao: string; out APrecoVenda: Double): Boolean;
  end;

implementation

constructor TProdutoController.Create;
begin
  FModel := TProdutoModel.Create;
end;

destructor TProdutoController.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TProdutoController.ConsultarProduto(ACodigo: Integer; out ADescricao: string; out APrecoVenda: Double): Boolean;
begin
  Result := FModel.ConsultarProduto(ACodigo, ADescricao, APrecoVenda);
end;

end.

