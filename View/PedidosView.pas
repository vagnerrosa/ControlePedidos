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

unit PedidosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Menus, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Imaging.pngimage,  Model.Connection, ClienteController,
  ProdutoController,PedidoController,ProdutoModel, PedidoModel;

type
  TfrmPedidosView = class(TForm)
    DsPedidoItem: TDataSource;
    pnlTopo: TPanel;
    pnlTop: TPanel;
    lblTopo: TLabel;
    pnlLinhaRodape: TPanel;
    pnlRodape: TPanel;
    pnlBackground: TPanel;
    pnlConsultaProduto: TPanel;
    lblCodigoBarras: TLabel;
    edtCodigoProduto: TEdit;
    pnlRodapeGrava: TPanel;
    pnlListaProdutos: TPanel;
    pnlTotalPagar: TPanel;
    lblTotalAPagar: TLabel;
    edtTotalAPagar: TEdit;
    DBG_produtos: TDBGrid;
    lblNomeProduto: TLabel;
    lblQTD: TLabel;
    edtVlrUnitario: TEdit;
    edtQTD: TEdit;
    lblVlrUnitario: TLabel;
    pnlCliente: TPanel;
    Label2: TLabel;
    edtCodCLiente: TEdit;
    lblNomeCliente: TLabel;
    SpeedButton1: TSpeedButton;
    mtbPedido: TFDMemTable;
    mtbPedidoItem: TFDMemTable;
    mtbPedidonumero_pedido: TIntegerField;
    mtbPedidodata_emissao: TDateField;
    mtbPedidocodigo_cliente: TIntegerField;
    mtbPedidovalor_total: TFloatField;
    mtbPedidoItemid: TIntegerField;
    mtbPedidoItemnumero_pedido: TIntegerField;
    mtbPedidoItemcodigo_produto: TIntegerField;
    mtbPedidoItemquantidade: TIntegerField;
    mtbPedidoItemvir_unitario: TFloatField;
    mtbPedidoItemvir_total: TFloatField;
    Label1: TLabel;
    lblData: TLabel;
    btnAdicionar: TBitBtn;
    mtbPedidoItemNomeProduto: TStringField;
    BtnGravarPedido: TBitBtn;
    pnlBuscaPedido: TPanel;
    Label3: TLabel;
    EditNumeroPedido: TEdit;
    sBtnBusca: TSpeedButton;
    pnlNovoPedido: TPanel;
    sBtnNovoPedido: TSpeedButton;
    pnlNumeroPedido: TPanel;
    lblPedido: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodCLienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LocalizaCliente(codClie : integer);
    procedure LocalizaProduto(codProd : integer);
    procedure edtCodigoProdutoExit(Sender: TObject);
    function  CalcularValorTotal: Double;
    procedure GravarNaMemTable(DataEmissao: TDate; CodigoCliente: Integer; ValorTotal: Double);
    procedure GravarItemNaMemTable(NumeroPedido: Integer; CodigoProduto: Integer; Quantidade: Integer; VirUnitario: Double; VirTotal: Double; NomeProduto: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtVlrUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_produtosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarPedidoClick(Sender: TObject);
    procedure sBtnBuscaClick(Sender: TObject);
    procedure sBtnNovoPedidoClick(Sender: TObject);
  private
    { Private declarations }
    Acao : string;
    ControllerCliente: TClienteController;
    ControllerProduto: TProdutoController;
    ControllerPedido: TPedidoController;
    procedure LimparCamposProduto;
    procedure LimparCamposGeral;
    procedure ExcluirItemSelecionado;
    procedure EditarItemSelecionado;
    procedure BuscarPedido;
    procedure GerenciaBuscaBotoes;
    function  RetornaDescricaoProduto(codProd : integer): String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmPedidosView: TfrmPedidosView;

implementation


{$R *.dfm}

uses uDM;

constructor TfrmPedidosView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Model.Connection.Connect;
  ControllerCliente := TClienteController.Create;
  ControllerProduto := TProdutoController.Create;
  ControllerPedido := TPedidoController.Create;
end;

procedure TfrmPedidosView.DBG_produtosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    // Chama o método para editar o item selecionado
    EditarItemSelecionado;
    Key := 0; // Impede o som padrão de "beep"
  end
  else if Key = VK_DELETE then
  begin
    // Chama o método para excluir o item selecionado
    ExcluirItemSelecionado;
    Key := 0; // Impede o som padrão de "beep"
  end;
end;

destructor TfrmPedidosView.Destroy;
begin
  ControllerCliente.Free;
  ControllerProduto.Free;
  Model.Connection.Disconect;
  inherited Destroy;
end;

procedure TfrmPedidosView.GerenciaBuscaBotoes;
begin
  if edtCodCLiente.Text = '' then
   begin
    pnlBuscaPedido.Visible     := true ;
    pnlConsultaProduto.enabled := false;
    btnAdicionar.Visible       := false;
    BtnGravarPedido.Visible    := false;
    pnlNovoPedido.Visible      := false;
   end
   else
   begin
    pnlBuscaPedido.Visible     := false;

    if Acao <> 'Busca' then
    begin
      pnlConsultaProduto.enabled := true;
      btnAdicionar.Visible       := true;
      BtnGravarPedido.Visible    := true;
      pnlNovoPedido.Visible      := false;
    end
    else
      pnlNovoPedido.Visible :=true;

   end;
end;


procedure TfrmPedidosView.LocalizaCliente(codClie : integer);
var
  Nome, Cidade, UF: string;
begin
  if ControllerCliente.ConsultarCliente(codClie, Nome, Cidade, UF) then
  begin
   lblNomeCliente.Caption := Nome + ' - Cidade: '+Cidade+' - UF: ' +UF;
  end
  else
  begin
    ShowMessage('Cliente não encontrado.');
  end;
end;

procedure TfrmPedidosView.LocalizaProduto(codProd : integer);
var
  Descricao: string;
  PrecoVenda: Double;
begin
  if ControllerProduto.ConsultarProduto(codProd, Descricao, PrecoVenda) then
  begin
    // Produto encontrado
    lblNomeProduto.Caption :=  Descricao;
    edtVlrUnitario.Text    :=  FormatFloat('0.00', PrecoVenda);
  end
  else
  begin
    // Produto não encontrado
    ShowMessage('Produto não encontrado.');
  end;
end;

function TfrmPedidosView.RetornaDescricaoProduto(codProd : integer): String;
var
  Descricao: string;
  PrecoVenda: Double;
begin
  if ControllerProduto.ConsultarProduto(codProd, Descricao, PrecoVenda) then
    Result :=   Descricao
  else
    Result := '';

end;

procedure TfrmPedidosView.edtCodCLienteExit(Sender: TObject);
begin
  GerenciaBuscaBotoes;
  if edtCodCLiente.Text <> '' then
  begin
   LocalizaCliente(StrToInt(edtCodCLiente.Text));
   lblData.Caption :=  DateToStr(now);
   edtCodigoProduto.SetFocus;
  end;
end;

procedure TfrmPedidosView.edtCodigoProdutoExit(Sender: TObject);
begin
if edtCodigoProduto.Text <> '' then
  LocalizaProduto(strtoint(edtCodigoProduto.Text));
end;

procedure TfrmPedidosView.edtVlrUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmPedidosView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mtbPedido.Close;
mtbPedidoItem.Close;
end;

procedure TfrmPedidosView.FormCreate(Sender: TObject);
var
  Mensagem : String;
begin
  if not DM.Conectar_DB then
  begin
    Mensagem:= ('Não foi possível conecar ao Banco de Dados'+ DM.MsgErro );
    ShowMessage(Mensagem);
  end;
end;

procedure TfrmPedidosView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmPedidosView.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #43 then
  begin

    key := #0;
    edtQTD.SetFocus;

  end;
end;

procedure TfrmPedidosView.FormShow(Sender: TObject);
begin
GerenciaBuscaBotoes;
LimparCamposGeral;
edtCodCLiente.SetFocus;

end;

procedure TfrmPedidosView.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPedidosView.sBtnBuscaClick(Sender: TObject);
begin
  BuscarPedido;
  GerenciaBuscaBotoes;
end;

procedure TfrmPedidosView.sBtnNovoPedidoClick(Sender: TObject);
begin
Acao := 'Novo';
edtCodCLiente.Text := '';
GerenciaBuscaBotoes;
LimparCamposGeral;
edtCodCLiente.SetFocus;
end;

procedure TfrmPedidosView.LimparCamposGeral;
begin
LimparCamposProduto;
edtCodCLiente.Clear;
edtTotalAPagar.Text :='0.00';
mtbPedido.Close;
mtbPedido.Open;
mtbPedidoItem.Close;
mtbPedidoItem.Open;
Acao := '';
pnlNumeroPedido.Visible := false;
lblPedido.Caption := '';
lblNomeCliente.Caption := '';
lblData.Caption := '';
end;

procedure TfrmPedidosView.LimparCamposProduto;
begin
edtCodigoProduto.Clear;
lblNomeProduto.Caption := '';
edtQTD.Text :='1';
edtVlrUnitario.Text := '0.00';
end;

procedure TfrmPedidosView.btnAdicionarClick(Sender: TObject);
begin

  if ((edtQTD.Text ='0') or (edtQTD.Text =''))  then
  begin
    ShowMessage('Verifique a Quantidade.');
    edtQTD.SetFocus;
    exit;
  end;

  if ((edtVlrUnitario.Text ='0') or (edtVlrUnitario.Text =''))  then
  begin
    ShowMessage('Verifique o Valor Unitário.');
    edtQTD.SetFocus;
    exit;
  end;

  GravarItemNaMemTable(0, strtoint(edtCodigoProduto.Text), strtoint(edtQTD.Text), StrToFloat(edtVlrUnitario.text), StrToFloat(edtVlrUnitario.Text), lblNomeProduto.Caption);
  edtTotalAPagar.Text := Formatfloat('###,###0.00',CalcularValorTotal);
  LimparCamposProduto;
  edtCodigoProduto.SetFocus;
end;

procedure TfrmPedidosView.BtnGravarPedidoClick(Sender: TObject);
begin
   Acao := 'Novo';
   if edtCodCLiente.Text ='' then
   begin
      ShowMessage('Erro ao gravar o pedido.' + #13 + 'Código do Cliente não podeser Vazio');
      edtCodCLiente.SetFocus;
      exit;
   end;

   if mtbPedidoItem.IsEmpty then
   begin
      ShowMessage('Erro ao gravar o pedido.' + #13 + 'Itens do Pedidos não podem estar vazios');
      exit;
   end;
  // Grava os dados do pedido
  GravarNaMemTable(date, strtoint(edtCodCLiente.Text),StrToFloat(edtTotalAPagar.Text));
   // Chama o método da Controller para gravar o pedido
  if ControllerPedido.GravarPedido(mtbPedido, mtbPedidoItem) then
   begin
    ShowMessage('Pedido gravado com sucesso!');
    LimparCamposGeral;
   end
  else
    ShowMessage('Erro ao gravar o pedido.');

  GerenciaBuscaBotoes;
end;

procedure TfrmPedidosView.GravarNaMemTable(DataEmissao: TDate; CodigoCliente: Integer; ValorTotal: Double);
begin
 mtbPedido.Append;
  try
    mtbPedidodata_emissao.AsDateTime := DataEmissao;
    mtbPedidocodigo_cliente.AsInteger := CodigoCliente;
    mtbPedidovalor_total.AsFloat := ValorTotal;

    mtbPedido.Post; // Salva a nova linha na tabela em memória
  except
    on E: Exception do
    begin
      mtbPedido.Cancel; // Cancela a adição em caso de erro
      ShowMessage('Erro ao gravar na tabela: ' + E.Message);
    end;
  end;
end;

procedure TfrmPedidosView.GravarItemNaMemTable(NumeroPedido: Integer; CodigoProduto: Integer; Quantidade: Integer; VirUnitario: Double; VirTotal: Double; NomeProduto: String);
begin

  if mtbPedidoItem.State <> dsEdit  then
    mtbPedidoItem.Append;

  try
    mtbPedidoItemnumero_pedido.AsInteger := NumeroPedido;
    mtbPedidoItemcodigo_produto.AsInteger := CodigoProduto;
    mtbPedidoItemquantidade.AsInteger := Quantidade;
    mtbPedidoItemvir_unitario.AsFloat := VirUnitario;
    mtbPedidoItemvir_total.AsFloat := Quantidade* VirUnitario;
    mtbPedidoItemNomeProduto.AsString := NomeProduto;

    mtbPedidoItem.Post; // Salva a nova linha na tabela em memória
  except
    on E: Exception do
    begin
      mtbPedidoItem.Cancel; // Cancela a adição em caso de erro
      ShowMessage('Erro ao gravar na tabela de itens: ' + E.Message);
    end;
  end;
end;

function TfrmPedidosView.CalcularValorTotal: Double;
var
  i: Integer;
  Total: Double;
begin
  Total := 0.0;

  mtbPedidoItem.First;
  while not mtbPedidoItem.Eof do
  begin
    Total := Total + mtbPedidoItemvir_total.AsFloat;
    mtbPedidoItem.Next;
  end;
  Result := Total;
end;

procedure TfrmPedidosView.EditarItemSelecionado;
var
  ProdutoID: Integer;
begin
  // Verifica se há um item selecionado
  if not (mtbPedidoItem.IsEmpty) and (DBG_produtos.DataSource.DataSet.RecNo > 0) then
  begin
    mtbPedidoItem.Edit;
    ProdutoID := mtbPedidoItem.FieldByName('codigo_produto').AsInteger;
    edtCodigoProduto.Text := IntToStr(ProdutoID);
    lblNomeProduto.Caption := mtbPedidoItem.FieldByName('NomeProduto').AsString;
    edtQTD.Text := mtbPedidoItem.FieldByName('quantidade').AsString;
    edtVlrUnitario.Text := FloatToStr(mtbPedidoItem.FieldByName('vir_unitario').AsFloat);

  end
  else
  begin
    ShowMessage('Selecione um item para editar.');
  end;
end;
procedure TfrmPedidosView.ExcluirItemSelecionado;
var
  Confirmacao: Integer;
begin
  // Verifica se há um item selecionado
  if not (mtbPedidoItem.IsEmpty) and (DBG_produtos.DataSource.DataSet.RecNo > 0) then
  begin
    // Confirma a exclusão
    if Application.MessageBox(PChar('Tem certeza que deseja excluir o item:' +
      #13 + mtbPedidoItemcodigo_produto.AsString+ ' - ' + mtbPedidoItemNomeProduto.AsString  + #13 +
      FormatFloat('0,.0000', mtbPedidoItemquantidade.AsFloat) + ' x '
      + FormatFloat('0,.00', mtbPedidoItemvir_unitario.AsFloat) +
      ' = ' + FormatFloat('0,.00',mtbPedidoItemvir_total.AsFloat  )+  ' ?'), 'Exclusão', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      // Exclui o item
      mtbPedidoItem.Delete; // Exclui a linha selecionada
      edtTotalAPagar.Text := Formatfloat('###,###0.00',CalcularValorTotal);
      ShowMessage('Item excluído com sucesso.');
    end;
  end
  else
  begin
    ShowMessage('Selecione um item para excluir.');
  end;
end;


procedure TfrmPedidosView.BuscarPedido;
var
  Pedido: TPedido;
  Produtos: TList<TPedidoProduto>;
begin
  // Chama o método da Controller para buscar o pedido
  if ControllerPedido.BuscarPedido(StrToInt(EditNumeroPedido.Text), Pedido, Produtos) then
  begin
    // Preenche os campos da view com os dados do pedido
     Acao := 'Busca';
     edtCodCLiente.Text := IntToStr(Pedido.CodigoCliente);
     LocalizaCliente(StrToInt(edtCodCLiente.Text));
     lblData.Caption := DateToStr(Pedido.DataEmissao);

    // Limpa o grid de produtos
    mtbPedidoItem.Close; // Assume que você esteja usando um dataset para os produtos
    mtbPedidoItem.Open;

    for var Produto in Produtos do
    begin
      mtbPedidoItem.Append; // Adiciona uma nova linha
      mtbPedidoItem.FieldByName('numero_pedido').AsInteger := Produto.NumeroPedido;
      mtbPedidoItem.FieldByName('codigo_produto').AsInteger := Produto.CodigoProduto;
      mtbPedidoItem.FieldByName('NomeProduto').AsString := RetornaDescricaoProduto(Produto.CodigoProduto);
      mtbPedidoItem.FieldByName('quantidade').AsInteger := Produto.Quantidade;
      mtbPedidoItem.FieldByName('vir_unitario').AsFloat := Produto.VirUnitario;
      mtbPedidoItem.FieldByName('vir_total').AsFloat := Produto.VirTotal;
      mtbPedidoItem.Post; // Salva a linha no dataset
    end;
    edtTotalAPagar.Text := Formatfloat('###,###0.00',CalcularValorTotal);
    if not mtbPedidoItem.FieldByName('numero_pedido').IsNull then
    begin
      pnlNumeroPedido.Visible := true;
      lblPedido.Caption := 'Pedido Nº :' + inttostr(mtbPedidoItem.FieldByName('numero_pedido').AsInteger);
    end;
  end
  else
  begin
    ShowMessage('Pedido não encontrado.');
  end;
end;


end.
