unit untCProduto;

interface

uses System.SysUtils, Data.Win.ADODB, untDataModuleWK, Dialogs;

 type TProduto = class

    private

    FGetidproduto: Integer;
    FGetdescricao: string;
    FGetprecovenda: Double;


    procedure Setidproduto(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setprecovenda(const Value: Double);


    protected


    Public

    property Getidproduto : Integer read FGetidproduto write Setidproduto;
    property Getdescricao : string read FGetdescricao write Setdescricao;
    property Getprecovenda   : Double read FGetprecovenda write Setprecovenda;

    function ConsultarProduto : Boolean;

    Constructor Create;    // declaração do metodo construtor

    Destructor  Destroy; Override;

    end;

implementation






{ TpedidoProduto }

{ TProduto }

function TProduto.ConsultarProduto: Boolean;
var
    ibQueryGenerica : TADOQuery;
begin
  try
  ibQueryGenerica := TADOQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.ADOConnectionwk;
  ibQueryGenerica.SQL.Add('SELECT idproduto, descricao, precovenda FROM cadproduto where idproduto = ' + IntToStr(FGetidproduto));
  ibQueryGenerica.Open;

  if not ibQueryGenerica.IsEmpty then
    begin
      FGetidproduto := ibQueryGenerica.fieldbyname('idproduto').AsInteger;
      FGetdescricao := ibQueryGenerica.fieldbyname('descricao').AsString;
      FGetprecovenda := ibQueryGenerica.fieldbyname('precovenda').AsFloat;

      Result := True;
    end
  else
    begin
      FGetidproduto := 0;
      FGetdescricao := '';
      FGetprecovenda := 0;

      Result := False;
    end;

  FreeAndNil(ibQueryGenerica);
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
end;

constructor TProduto.Create;
begin
  FGetidproduto := 0;
  FGetdescricao := '';
  FGetprecovenda := 0;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

procedure TProduto.Setdescricao(const Value: string);
begin
  FGetdescricao := Value;
end;

procedure TProduto.Setidproduto(const Value: Integer);
begin
  FGetidproduto := Value;
end;

procedure TProduto.Setprecovenda(const Value: Double);
begin
  FGetprecovenda := Value;
end;

end.
