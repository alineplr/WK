program WK;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDataModuleWK in 'untDataModuleWK.pas' {DataModuleWK: TDataModule},
  untPedidoVenda in 'untPedidoVenda.pas' {frmPedidoVenda},
  untCPedido in 'untCPedido.pas',
  untCPedidoProduto in 'untCPedidoProduto.pas',
  untCProduto in 'untCProduto.pas',
  untPedidoItem in 'untPedidoItem.pas' {frmPedidoItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleWK, DataModuleWK);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  //Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);

  Application.Run;
end.
