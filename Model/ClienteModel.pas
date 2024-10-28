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
unit ClienteModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,db,Model.Connection;

type
  TCliente = class
  private
    FConnection: TFDConnection;
  public
    constructor Create;
    destructor  Destroy; override;
    function AdicionarCliente(const ANome, ACidade, AUf: string): Integer;
    function AtualizarCliente(ACodigo: Integer; const ANome, ACidade, AUf: string): Boolean;
    function RemoverCliente(ACodigo: Integer): Boolean;
    function ConsultarCliente(ACodigo: Integer; out ANome, ACidade, AUf: string): Boolean;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  Model.Connection.Connect;
end;

destructor TCliente.Destroy;
begin
    Model.Connection.Disconect;
end;


function TCliente.AdicionarCliente(const ANome, ACidade, AUf: string): Integer;
var
  Query: TFDQuery;
begin
  Result := 0; // Inicializa o resultado como 0
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Model.Connection.FConnection; // Define a conexão

    // Insere um novo cliente
    Query.SQL.Text := 'INSERT INTO clientes (nome, cidade, uf) VALUES (:nome, :cidade, :uf)';
    Query.ParamByName('nome').AsString := ANome;
    Query.ParamByName('cidade').AsString := ACidade;
    Query.ParamByName('uf').AsString := AUf;
    Query.ExecSQL;

    // Obtém o código do cliente recém-criado
    Query.SQL.Text := 'SELECT LAST_INSERT_ID()'; // Para MySQL
    Query.Open;
    Result := Query.Fields[0].AsInteger;
  finally
    Query.Free; // Libera o objeto da consulta
  end;
end;

function TCliente.AtualizarCliente(ACodigo: Integer; const ANome, ACidade, AUf: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False; // Inicializa o resultado como falso
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Model.Connection.FConnection; // Define a conexão

    // Atualiza os dados do cliente
    Query.SQL.Text := 'UPDATE clientes SET nome = :nome, cidade = :cidade, uf = :uf WHERE codigo = :codigo';
    Query.ParamByName('nome').AsString := ANome;
    Query.ParamByName('cidade').AsString := ACidade;
    Query.ParamByName('uf').AsString := AUf;
    Query.ParamByName('codigo').AsInteger := ACodigo;
    Query.ExecSQL;  // Retorna verdadeiro se alguma linha foi atualizada
    Result :=  true;
  finally
    Query.Free; // Libera o objeto da consulta
  end;
end;

function TCliente.RemoverCliente(ACodigo: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False; // Inicializa o resultado como falso
  Query := TFDQuery.Create(nil);
  try
    Query.Connection :=Model.Connection.FConnection; // Define a conexão

    // Remove o cliente
    Query.SQL.Text := 'DELETE FROM clientes WHERE codigo = :codigo';
    Query.ParamByName('codigo').AsInteger := ACodigo;
    Query.ExecSQL; // Retorna verdadeiro se alguma linha foi removida
    Result :=true;
  finally
    Query.Free; // Libera o objeto da consulta
  end;
end;

function TCliente.ConsultarCliente(ACodigo: Integer; out ANome, ACidade, AUf: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False; // Inicializa o resultado como falso
  ANome := '';
  ACidade := '';
  AUf := '';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Model.Connection.FConnection; // Define a conexão

    Query.SQL.Text := 'SELECT nome, cidade, uf FROM clientes WHERE codigo = :codigo';
    Query.ParamByName('codigo').AsInteger := ACodigo;
    Query.Open;

    // Verifica se o cliente foi encontrado
    if not Query.IsEmpty then
    begin
      ANome := Query.FieldByName('nome').AsString;
      ACidade := Query.FieldByName('cidade').AsString;
      AUf := Query.FieldByName('uf').AsString;
      Result := True; // Retorna verdadeiro se o cliente foi encontrado
    end;
  finally
    Query.Free; // Libera o objeto da consulta
  end;
end;

end.

