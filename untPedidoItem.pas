unit untPedidoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Data.DB, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Menus, Vcl.StdCtrls,  untCProduto,  Vcl.ExtCtrls;

type
  TfrmPedidoItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edQuantidade: TEdit;
    edValorUnit: TEdit;
    edValorTotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Label7: TLabel;
    Button2: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edValorUnitExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
        Produto : TProduto;
  public
    { Public declarations }
    vAcaoItem : Integer;


  end;

var
  frmPedidoItem: TfrmPedidoItem;

implementation

{$R *.dfm}

uses untPedidoVenda;

procedure TfrmPedidoItem.Button1Click(Sender: TObject);
begin
  if Produto.Getidproduto = 0 then
    begin
      ShowMessage('Códgo de produto inválido!');
      edCodigo.SetFocus;
      Exit;
    end;

  if Produto.Getdescricao = '' then
    begin
      ShowMessage('Produto inválido!');
      edCodigo.SetFocus;
      Exit;
    end;

  if (edQuantidade.Text = '') or (edQuantidade.Text = '0') then
    begin
      ShowMessage('Quantidade inválido!');
      edQuantidade.SetFocus;
      Exit;
    end;

  if edValorUnit.Text = '' then
    begin
      ShowMessage('Valor unitário inválido!');
      edValorUnit.SetFocus;
      Exit;
    end;

  try

  frmPedidoVenda.restPedidoItem.FieldByName('idproduto').AsInteger := Produto.Getidproduto;
  frmPedidoVenda.restPedidoItem.FieldByName('produto').AsString := Produto.Getdescricao;
  frmPedidoVenda.restPedidoItem.FieldByName('quantidade').AsFloat := StrToFloat(edQuantidade.Text);
  frmPedidoVenda.restPedidoItem.FieldByName('valorunit').AsFloat := StrToFloat(edValorUnit.Text);
  frmPedidoVenda.restPedidoItem.FieldByName('valortotalproduto').AsFloat := StrToFloat(edValorTotal.Text);

  frmPedidoVenda.restPedidoItem.Post;

  Close;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;

end;

procedure TfrmPedidoItem.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoItem.edCodigoExit(Sender: TObject);
begin
  try

  if edCodigo.Text = '' then
    edCodigo.Text := '0';

  Produto.Getidproduto := StrToInt(edCodigo.Text);
  if not Produto.ConsultarProduto then
    ShowMessage('Códgo de produto inválido!');

  edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',Produto.Getprecovenda);
  edDescricao.Text := Produto.Getdescricao;

  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;

end;

procedure TfrmPedidoItem.edQuantidadeExit(Sender: TObject);
begin
  try
  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
end;

procedure TfrmPedidoItem.edQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-'
    then Key := #0;
end;

procedure TfrmPedidoItem.edValorUnitExit(Sender: TObject);
begin
  try
  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
end;

procedure TfrmPedidoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  if frmPedidoVenda.restPedidoItem.State in [dsInsert,dsEdit] then
    frmPedidoVenda.restPedidoItem.Cancel;

  FreeAndNil(Produto);
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
end;

procedure TfrmPedidoItem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
       Perform(WM_nextdlgctl,0,0)
   else if Key =  #27 then
       Perform(WM_nextdlgctl,1,0)
end;

procedure TfrmPedidoItem.FormShow(Sender: TObject);
begin
  try
  if vAcaoItem = 0 then
    begin
    frmPedidoVenda.restPedidoItem.Insert;
    edCodigo.Clear;
    edDescricao.Clear;
    edQuantidade.Clear;
    edValorUnit.Clear;
    edValorTotal.Clear;

    edCodigo.ReadOnly := False;
    end
  else
    begin
    frmPedidoVenda.restPedidoItem.Edit;
    edCodigo.Text := frmPedidoVenda.restPedidoItem.FieldByName('idproduto').AsString;
    edDescricao.Text := frmPedidoVenda.restPedidoItem.FieldByName('produto').AsString;
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',frmPedidoVenda.restPedidoItem.FieldByName('quantidade').AsFloat);
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',frmPedidoVenda.restPedidoItem.FieldByName('valorunit').AsFloat);
    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',frmPedidoVenda.restPedidoItem.FieldByName('valortotalproduto').AsFloat);

    edCodigo.ReadOnly := True;
    end;

  Produto := TProduto.Create;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
end;

end.
