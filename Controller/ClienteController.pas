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
unit ClienteController;

interface

uses
  System.SysUtils, ClienteModel,FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TClienteController = class
  private
    FModel: TCliente;
  public
    constructor Create;
    function AdicionarCliente(const ANome, ACidade, AUf: string): Integer;
    function AtualizarCliente(ACodigo: Integer; const ANome, ACidade, AUf: string): Boolean;
    function RemoverCliente(ACodigo: Integer): Boolean;
    function ConsultarCliente(ACodigo: Integer; out ANome, ACidade, AUf: string): Boolean;
  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  FModel := TCliente.Create;
end;

function TClienteController.AdicionarCliente(const ANome, ACidade, AUf: string): Integer;
begin
  Result := FModel.AdicionarCliente(ANome, ACidade, AUf);
end;

function TClienteController.AtualizarCliente(ACodigo: Integer; const ANome, ACidade, AUf: string): Boolean;
begin
  Result := FModel.AtualizarCliente(ACodigo, ANome, ACidade, AUf);
end;

function TClienteController.RemoverCliente(ACodigo: Integer): Boolean;
begin
  Result := FModel.RemoverCliente(ACodigo);
end;

function TClienteController.ConsultarCliente(ACodigo: Integer; out ANome, ACidade, AUf: string): Boolean;
begin
  Result := FModel.ConsultarCliente(ACodigo, ANome, ACidade, AUf);
end;

end.

