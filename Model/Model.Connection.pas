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
unit Model.Connection;

interface

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Intf, FireDAC.UI.Intf,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, System.Classes,  System.IniFiles, System.SysUtils,
  FireDAC.DatS,  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLCli,  FireDAC.VCLUI.Wait,
  FireDAC.Comp.DataSet,FireDAC.Comp.UI;


var
    FConnection : TFDConnection;
    MySQLDriverLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor : TFDGUIxWaitCursor ;

function SetupConnection(FConn: TFDConnection): String;
function Connect : TFDConnection;
procedure Disconect;

implementation

function SetupConnection(FConn: TFDConnection): string;
var
    arq_ini : string;
    ini : TIniFile;
begin
    try
        try
            arq_ini := GetCurrentDir + '\Pedidos.ini';

            // Verifica se INI existe...
            if NOT FileExists(arq_ini) then
            begin
                Result := 'Arquivo INI não encontrado: ' + arq_ini;
                exit;
            end;
            // Instanciar arquivo INI...
            ini := TIniFile.Create(arq_ini);
            FConn.DriverName := 'MySQL'; // Nome do driver para SQL Server
           // Buscar dados do arquivo fisico...
            FConn.Params.Values['DriverID'] := ini.ReadString('Config', 'DriverID', '');
            FConn.Params.Values['Database'] := ini.ReadString('Config', 'Database', '');
            FConn.Params.Values['User_name'] := ini.ReadString('Config', 'Username', '');
            FConn.Params.Values['Password'] := ini.ReadString('Config', 'Password', '');
            FConn.Params.Values['DriverID'] := ini.ReadString('Config', 'DriverID', '');
            FConn.Params.Add('Port=' + ini.ReadString('Config', 'Port', '3306'));
            FConn.Params.Add('Server=' + ini.ReadString('Config', 'Server', 'localhost'));
            MySQLDriverLink.VendorLib := GetCurrentDir + 'dll\libmySQL.dll';
            Result := 'OK';
        except on ex:exception do
            Result := 'Erro ao configurar banco: ' + ex.Message;
        end;

    finally
        if Assigned(ini) then
            ini.DisposeOf;
    end;
end;

function Connect : TFDConnection;
begin
  FConnection := TFDConnection.Create(nil);
  // Criação do link do driver
  MySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);

  SetupConnection(FConnection);
  FConnection.Connected := true;

  Result := FConnection;
end;

procedure Disconect;
begin
    if Assigned(FConnection) then
    begin
        if FConnection.Connected then
            FConnection.Connected := false;

       MySQLDriverLink.Free; // Liberar o driver link
       FConnection.Free;
    end;

end;


end.
