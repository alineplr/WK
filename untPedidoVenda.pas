unit untPedidoVenda;

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
  dxSkinXmas2008Blue, cxLabel, Vcl.ExtCtrls, cxClasses, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxTextEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, Vcl.Menus,
  cxGroupBox, cxCurrencyEdit, Vcl.StdCtrls, cxButtons, Datasnap.DBClient,
  uDWConstsData, uRESTDWPoolerDB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,DateUtils, Vcl.Grids,
  Vcl.DBGrids, uDWDataset, cxRadioGroup, UCBase, Vcl.Mask, Vcl.DBCtrls,
  Data.Win.ADODB, untCPedido, untCPedidoProduto, untCProduto, untPedidoItem;

type
  TfrmPedidoVenda = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel2: TPanel;
    dtPedidoVenda: TDataSource;
    dtCliente: TDataSource;
    dtPedidoItem: TDataSource;
    cxButton4: TcxButton;
    restPedidoVenda: TADODataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel8: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCliente: TDBLookupComboBox;
    Panel9: TPanel;
    Panel13: TPanel;
    btIncluir: TButton;
    btSalvar: TButton;
    restCliente: TADODataSet;
    restClienteidcliente: TIntegerField;
    restClientenome: TStringField;
    restClientecidade: TStringField;
    restClienteuf: TStringField;
    edCodigo: TEdit;
    edDataEmissao: TDateTimePicker;
    edValorTotal: TEdit;
    restPedidoVendaidpedido: TIntegerField;
    restPedidoVendadataemissao: TDateField;
    restPedidoVendaidcliente: TIntegerField;
    restPedidoVendavalortotal: TBCDField;
    restPedidoVendanome: TStringField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    restPedidoItem: TADODataSet;
    restPedidoItemidpedidoproduto: TAutoIncField;
    restPedidoItemidpedido: TIntegerField;
    restPedidoItemidproduto: TIntegerField;
    restPedidoItemquantidade: TBCDField;
    restPedidoItemvalorunit: TBCDField;
    restPedidoItemvalortotalproduto: TBCDField;
    restPedidoItemproduto: TStringField;
    Panel3: TPanel;
    Button1: TButton;
    btCarregarPedido: TButton;
    btCancelarPedido: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    restID: TADODataSet;
    restIDcodigo: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton4Click(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCarregarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure restPedidoVendaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure calcularValorTotal;

  public
    { Public declarations }
    vAcao : Integer;
    cPedido : Tpedido;
  end;


var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

uses untDataModuleWK;

procedure TfrmPedidoVenda.btSalvarClick(Sender: TObject);
var
  Pedido : Tpedido;
  PedidoItem : TpedidoProduto;
begin

  Pedido := Tpedido.Create;
  if vAcao = 1 then
    Pedido.Getidpedido := StrToInt(edCodigo.Text);
  Pedido.Getdataemissao := edDataEmissao.Date;
  Pedido.Getidcliente := edCliente.KeyValue;
  if edValorTotal.Text = '' then
    Pedido.Getvalortotal := 0
  else
    Pedido.Getvalortotal := StrToFloat(edValorTotal.Text);


  restID.Close;
  Pedido.SalvarPedido;
  restID.Open;

  if vAcao = 0 then
    begin
    Pedido.Getidpedido := restID.FieldByName('codigo').AsInteger;
    edCodigo.Text := IntToStr(Pedido.Getidpedido);
    end;

  PedidoItem := TpedidoProduto.Create;

  restPedidoItem.First;
  while not restPedidoItem.Eof do
    begin
      PedidoItem.Getidpedidoproduto := restPedidoItem.FieldByName('idpedidoproduto').AsInteger;
      if vAcao = 0 then
          PedidoItem.Getidpedido := restID.FieldByName('codigo').AsInteger

      else
          PedidoItem.Getidpedido := restPedidoVenda.FieldByName('idpedido').AsInteger;


      PedidoItem.Getidproduto := restPedidoItem.FieldByName('idproduto').AsInteger;
      PedidoItem.Getquantidade := restPedidoItem.FieldByName('quantidade').AsFloat;
      PedidoItem.Getvalorunit := restPedidoItem.FieldByName('valorunit').AsFloat;
      PedidoItem.Getvalortotalproduto := restPedidoItem.FieldByName('valortotalproduto').AsFloat;

      PedidoItem.SalvarPedidoProduto;

      restPedidoItem.Next;
    end;


  //restPedidoVenda.Close;
  restPedidoItem.Close;
  restPedidoItem.Parameters.ParamByName('vidpedido').Value := Pedido.Getidpedido;
  restPedidoItem.Open;

  FreeAndNil(Pedido);
  FreeAndNil(PedidoItem);
end;

procedure TfrmPedidoVenda.Button1Click(Sender: TObject);
begin
  if frmPedidoItem = nil then
        begin
          Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
          frmPedidoItem.vAcaoItem := 0;
          frmPedidoItem.ShowModal;
          FreeAndNil(frmPedidoItem);

          calcularValorTotal;
        end;
end;

procedure TfrmPedidoVenda.btCarregarPedidoClick(Sender: TObject);
var
  vidPedido : string;
  Pedido : Tpedido;
  PedidoProduto : TpedidoProduto;
  ibQueryGenerica : TADOQuery;
begin
  vidPedido := InputBox('Pedido', 'Digite o n�mero do pedido', '');

  if vidPedido <> '' then
    begin
      Pedido := Tpedido.Create;
      PedidoProduto := TpedidoProduto.Create;
      PedidoProduto.Getidpedido := restPedidoVenda.FieldByName('idpedido').AsInteger;

      PedidoProduto.ApagarItenPedido;
      restPedidoItem.Close;
      restPedidoItem.Parameters.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;


      Pedido.Getidpedido := StrToInt(vidPedido);
      Pedido.CarregarrPedido;

      PedidoProduto.Getidpedido :=  Pedido.Getidpedido;

      edCliente.KeyValue := Pedido.Getidcliente;
      edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',Pedido.Getvalortotal);


      ibQueryGenerica := TADOQuery.Create(nil);
      ibQueryGenerica.Connection := DataModuleWK.ADOConnectionwk;
      ibQueryGenerica.SQL.Add('select * from cadpedidoproduto where idpedido = ' + IntToStr(Pedido.Getidpedido));
      ibQueryGenerica.Open;

      ibQueryGenerica.First;
      while not ibQueryGenerica.Eof do
        begin
          restPedidoItem.Insert;
          restPedidoItem.FieldByName('idpedido').AsInteger := restPedidoVenda.FieldByName('idpedido').AsInteger;
          restPedidoItem.FieldByName('idproduto').AsInteger := ibQueryGenerica.FieldByName('idproduto').AsInteger;
          restPedidoItem.FieldByName('quantidade').AsFloat := ibQueryGenerica.FieldByName('quantidade').AsFloat;
          restPedidoItem.FieldByName('valorunit').AsFloat := ibQueryGenerica.FieldByName('valorunit').AsFloat;
          restPedidoItem.FieldByName('valortotalproduto').AsFloat := ibQueryGenerica.FieldByName('valortotalproduto').AsFloat;

          restPedidoItem.Post;
          ibQueryGenerica.Next
        end;


      FreeAndNil(Pedido);
      FreeAndNil(PedidoProduto);
      FreeAndNil(ibQueryGenerica);
      btSalvarClick(Sender);
    end;


end;

procedure TfrmPedidoVenda.btCancelarPedidoClick(Sender: TObject);
var
  vidPedido : string;
  Pedido : Tpedido;
  PedidoProduto : TpedidoProduto;
  ibQueryGenerica : TADOQuery;
begin
  vidPedido := InputBox('Pedido', 'Digite o n�mero do pedido', '');

  if vidPedido <> '' then
    begin
      Pedido := Tpedido.Create;
      PedidoProduto := TpedidoProduto.Create;
      PedidoProduto.Getidpedido := restPedidoVenda.FieldByName('idpedido').AsInteger;

      PedidoProduto.ApagarItenPedido;

      Pedido.Getidpedido := StrToInt(vidPedido);
      Pedido.ApagarPedido;

      restPedidoVenda.Close;
      restPedidoVenda.Open;

      edCodigo.Text := restPedidoVenda.FieldByName('idpedido').AsString;
      edDataEmissao.Date := restPedidoVenda.FieldByName('dataemissao').AsDateTime;
      edCliente.KeyValue := restPedidoVenda.FieldByName('idcliente').AsInteger;
      edValorTotal.Text :=  FormatFloat('#,##0.00;(#,##0.00)',restPedidoVenda.FieldByName('valortotal').AsFloat);

      restPedidoItem.Close;
      restPedidoItem.Parameters.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;


      (*Pedido.CarregarrPedido;

      PedidoProduto.Getidpedido :=  Pedido.Getidpedido;

      edCliente.KeyValue := Pedido.Getidcliente;
      edValorTotal.Text := FloatToStr(Pedido.Getvalortotal);


      ibQueryGenerica := TADOQuery.Create(nil);
      ibQueryGenerica.Connection := DataModuleWK.ADOConnectionwk;
      ibQueryGenerica.SQL.Add('select * from cadpedidoproduto where idpedido = ' + IntToStr(Pedido.Getidpedido));
      ibQueryGenerica.Open;

      ibQueryGenerica.First;
      while not ibQueryGenerica.Eof do
        begin
          restPedidoItem.Insert;
          restPedidoItem.FieldByName('idpedido').AsInteger := restPedidoVenda.FieldByName('idpedido').AsInteger;
          restPedidoItem.FieldByName('idproduto').AsInteger := ibQueryGenerica.FieldByName('idproduto').AsInteger;
          restPedidoItem.FieldByName('quantidade').AsFloat := ibQueryGenerica.FieldByName('quantidade').AsFloat;
          restPedidoItem.FieldByName('valorunit').AsFloat := ibQueryGenerica.FieldByName('valorunit').AsFloat;
          restPedidoItem.FieldByName('valortotalproduto').AsFloat := ibQueryGenerica.FieldByName('valortotalproduto').AsFloat;

          restPedidoItem.Post;
          ibQueryGenerica.Next
        end;
                *)

      FreeAndNil(Pedido);
      FreeAndNil(PedidoProduto);
      FreeAndNil(ibQueryGenerica);
      btSalvarClick(Sender);
    end;

end;

procedure TfrmPedidoVenda.btIncluirClick(Sender: TObject);
begin
  if not (restPedidoVenda.State = dsBrowse)
    then restPedidoVenda.Cancel;

  restPedidoVenda.Insert;
  vAcao := 0;
  edCodigo.Clear;
  edDataEmissao.Date := Date;
  edCliente.KeyValue := 0;
  edValorTotal.Clear;

  restPedidoItem.Close;
  restPedidoItem.Parameters.ParamByName('vidpedido').Value := 0;
  restPedidoItem.Open;

end;

procedure TfrmPedidoVenda.calcularValorTotal;
var
  vValorTotal : Double;
begin
  restPedidoItem.First;
  vValorTotal := 0;
  while not restPedidoItem.Eof do
    begin
      vValorTotal := vValorTotal + restPedidoItem.FieldByName('valortotalproduto').AsFloat;
      restPedidoItem.Next;
    end;

    //restPedidoVenda.FieldByName('valortotal').AsFloat := vValorTotal;
    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',vValorTotal);

end;

procedure TfrmPedidoVenda.cxButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  PedidoItem : TpedidoProduto;
begin
if Key = VK_DELETE then
    begin
       if MessageDlg('Deseja Excluir esse item ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
          if restPedidoItem.FieldByName('idpedidoproduto').IsNull then
            begin
              restPedidoItem.Delete;
            end
          else
            begin
              PedidoItem := TpedidoProduto.Create;
              PedidoItem.Getidpedidoproduto := restPedidoItem.FieldByName('idpedidoproduto').AsInteger;
              PedidoItem.Getidpedido := restPedidoItem.FieldByName('idpedido').AsInteger;
              if PedidoItem.ApagarPedidoProduto then
                begin
                  restPedidoItem.Close;
                  restPedidoItem.Parameters.ParamByName('vidpedido').Value := PedidoItem.Getidpedido;
                  restPedidoItem.Open;
                end;
            end;

            calcularValorTotal;
       end;
    end;
end;

procedure TfrmPedidoVenda.DBGrid1KeyPress(Sender: TObject; var Key: Char);

begin
  If Key = #13 Then
    begin
      if frmPedidoItem = nil then
        begin
          Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
          frmPedidoItem.vAcaoItem := 1;
          frmPedidoItem.ShowModal;
          FreeAndNil(frmPedidoItem);

          calcularValorTotal;
        end;
    end;


end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  restPedidoVenda.Open;
  restCliente.Open;
  Screen.Cursor := crDefault;
end;

procedure TfrmPedidoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
     Perform(WM_nextdlgctl,0,0)
 else if Key =  #27 then
     Perform(WM_nextdlgctl,1,0)
end;

procedure TfrmPedidoVenda.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    begin
      edCodigo.Text := restPedidoVenda.FieldByName('idpedido').AsString;
      edDataEmissao.Date := restPedidoVenda.FieldByName('dataemissao').AsDateTime;
      edCliente.KeyValue := restPedidoVenda.FieldByName('idcliente').AsInteger;
      edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',restPedidoVenda.FieldByName('valortotal').AsFloat);

      restPedidoItem.Close;
      restPedidoItem.Parameters.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;

      if restPedidoVenda.IsEmpty then
        vAcao := 0
      else
        vAcao := 1;


    end
  else
    begin
      restPedidoVenda.Close;
      restPedidoVenda.Open;
    end;
end;

procedure TfrmPedidoVenda.restPedidoVendaAfterScroll(DataSet: TDataSet);
begin
  if (restPedidoVenda.FieldByName('idcliente').IsNull) and (not restPedidoVenda.FieldByName('idpedido').IsNull)  then
    begin
      btCarregarPedido.Visible := True;
      btCancelarPedido.Visible := True;
    end
  else
    begin
      btCarregarPedido.Visible := False;
      btCancelarPedido.Visible := False;
    end;
end;

end.
