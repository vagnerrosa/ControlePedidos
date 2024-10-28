program Pedidos;

uses
  Vcl.Forms,
  ProdutoModel in 'Model\ProdutoModel.pas',
  uDM in 'DAO\uDM.pas' {DM: TDataModule},
  PedidosView in 'View\PedidosView.pas' {frmPedidosView},
  ClienteModel in 'Model\ClienteModel.pas',
  ClienteController in 'Controller\ClienteController.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  ProdutoController in 'Controller\ProdutoController.pas',
  PedidoController in 'Controller\PedidoController.pas',
  PedidoModel in 'Model\PedidoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPedidosView, frmPedidosView);
  Application.Run;
end.
