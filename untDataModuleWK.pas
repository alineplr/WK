unit untDataModuleWK;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.Win.ADODB;

type
  TDataModuleWK = class(TDataModule)
    ADOConnectionwk: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleWK: TDataModuleWK;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleWK.DataModuleCreate(Sender: TObject);
begin
  ADOConnectionwk.Connected := True;
end;

end.
