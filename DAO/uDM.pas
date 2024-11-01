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
unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IniFiles, System.Variants,  Winapi.Windows, vcl.Dialogs, vcl.Forms   ;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    function  Conectar_DB: Boolean;
    function  Ler_Arquivo_Ini: Boolean;
  private
    { Private declarations }
      Conexao: TFDConnection;
      Server: string;
      Database: string;
      Port: string;
      Username: string;
      Password: string;
      DriverID : string;
      DLL      : string;
  public
    { Public declarations }
      MsgErro: string;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
function TDM.Conectar_DB: Boolean;
begin
  Result := True;
  if not Ler_Arquivo_Ini then
  begin
    Result   := False;
    MsgErro := 'O arquivo .ini não foi encontrado!';
  end
  else
  begin
    FDConnection.Connected := False;
    FDConnection.Params.Clear;
    FDConnection.LoginPrompt := False;
    FDConnection.DriverName := 'MySQL';
    FDConnection.Params.Clear;
    FDConnection.Params.Add('Server=' + Server);
    FDConnection.Params.Add('Database=' + Database);
    FDConnection.Params.Add('Port=' + Port);
    FDConnection.Params.Add('User_name=' + Username);
    FDConnection.Params.Add('Password=' + Password);
    FDConnection.Params.Add('DriverID=' + DriverID);
    FDPhysMySQLDriverLink.VendorLib := DLL;
    try
      FDConnection.Connected := True;
    except
      on e:Exception do
      begin
        MsgErro := e.Message;
        Result   := False;
      end;
    end;
  end;
end;

function TDM.Ler_Arquivo_Ini: Boolean;
var
  IniFile : string;
  Ini : TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  if not FileExists( IniFile ) then
    Result := False
  else
  begin
    try
      Server   := Ini.ReadString('Config','Server', '');
      Database := Ini.ReadString('Config','Database', '');
      Port     := Ini.ReadString('Config','Port', '');
      Username := Ini.ReadString('Config','Username', '');
      Password := Ini.ReadString('Config','Password', '');
      DriverID := Ini.ReadString('Config','DriverID', '');
      DLL      := Ini.ReadString('Config','Dll', '');
    finally
      Result := True;
      Ini.Free;
    end;
  end;
end;

procedure TDM.FDConnectionBeforeConnect(Sender: TObject);
begin
//  FDPhysMySQLDriverLink.VendorLib := ExtractFilePath(Application.ExeName)+'dll\libmySQL.dll';

end;
end.

