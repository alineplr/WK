unit untPedidoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, Vcl.ExtCtrls, dxSkinscxPCPainter,
  dxBarBuiltInMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  uRESTDWPoolerDB, cxCurrencyEdit, cxDBEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxButtonEdit,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, cxPC, cxClasses,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, uDWDataset, cxGroupBox, cxRadioGroup, untCProduto;

type
  TfrmPedidoItem = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    restProduto: TRESTDWClientSQL;
    dtCliente: TDataSource;
    restProdutoID_PRODUTO: TIntegerField;
    restProdutoCODIGO: TStringField;
    restProdutoDESCRICAO: TStringField;
    restProdutoDESCRICAOCURTA: TStringField;
    restProdutoPESOLIQUIDO: TSingleField;
    restProdutoPESOEMBALAGEM: TSingleField;
    restProdutoID_UNIDADE: TIntegerField;
    cxButton4: TcxButton;
    restProdutoID_GRUPOPRODUTO: TIntegerField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton4Click(Sender: TObject);
    procedure edQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edValorUnitExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
      ShowMessage('C�dgo de produto inv�lido!');
      edCodigo.SetFocus;
      Exit;
    end;

  if Produto.Getdescricao = '' then
    begin
      ShowMessage('Produto inv�lido!');
      edCodigo.SetFocus;
      Exit;
    end;

  if (edQuantidade.Text = '') or (edQuantidade.Text = '0') then
    begin
      ShowMessage('Quantidade inv�lido!');
      edQuantidade.SetFocus;
      Exit;
    end;

  if edValorUnit.Text = '' then
    begin
      ShowMessage('Valor unit�rio inv�lido!');
      edValorUnit.SetFocus;
      Exit;
    end;

  frmPedidoVenda.restPedidoItem.FieldByName('idproduto').AsInteger := Produto.Getidproduto;
  frmPedidoVenda.restPedidoItem.FieldByName('produto').AsString := Produto.Getdescricao;
  frmPedidoVenda.restPedidoItem.FieldByName('quantidade').AsFloat := StrToFloat(edQuantidade.Text);
  frmPedidoVenda.restPedidoItem.FieldByName('valorunit').AsFloat := StrToFloat(edValorUnit.Text);
  frmPedidoVenda.restPedidoItem.FieldByName('valortotalproduto').AsFloat := StrToFloat(edValorTotal.Text);

  frmPedidoVenda.restPedidoItem.Post;

  Close;

end;

procedure TfrmPedidoItem.cxButton4Click(Sender: TObject);
begin
  //if (frmPedidoVenda.restProdutoItem.State = dsInsert) or(frmPedidoVenda.restProdutoItem.State = dsEdit) then
  //  begin
  //    frmPedidoVenda.restProdutoItem.Cancel;
 //   end;
  Close;
end;

procedure TfrmPedidoItem.edCodigoExit(Sender: TObject);
begin

  if edCodigo.Text = '' then
    edCodigo.Text := '0';

  Produto.Getidproduto := StrToInt(edCodigo.Text);
  if not Produto.ConsultarProduto then
    ShowMessage('C�dgo de produto inv�lido!');

  //restPedidoItem.FieldByName('idproduto').AsInteger := Produto.Getidproduto;
  edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',Produto.Getprecovenda);
  edDescricao.Text := Produto.Getdescricao;

  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));

end;

procedure TfrmPedidoItem.edQuantidadeExit(Sender: TObject);
begin
  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));
end;

procedure TfrmPedidoItem.edQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-'
    then Key := #0;
end;

procedure TfrmPedidoItem.edValorUnitExit(Sender: TObject);
begin
  if edQuantidade.Text = '' then
    edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if edValorUnit.Text = '' then
    edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(edQuantidade.Text) * StrToFloat(edValorUnit.Text)));
end;

procedure TfrmPedidoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmPedidoVenda.restPedidoItem.State in [dsInsert,dsEdit] then
    frmPedidoVenda.restPedidoItem.Cancel;

  FreeAndNil(Produto);
end;

procedure TfrmPedidoItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
(*if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);     *)
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
end;

end.
