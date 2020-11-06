object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  BorderWidth = 10
  ClientHeight = 665
  ClientWidth = 1073
  Color = 9145227
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1073
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = 4105706
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 2
    object Label7: TLabel
      Left = 7
      Top = 5
      Width = 78
      Height = 23
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 1034
      Top = 3
      Width = 35
      Height = 25
      Caption = 'X'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 1073
    Height = 8
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 1073
    Height = 625
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Consulta'
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 1065
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 64
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 19
        Width = 1065
        Height = 575
        Align = alClient
        DataSource = dtPedidoVenda
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'idpedido'
            Title.Caption = 'C'#243'd. Pedido'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idcliente'
            Title.Caption = 'C'#243'd Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Cliente'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Title.Caption = 'Valor Total'
            Width = 181
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1065
        Height = 594
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1065
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 58
            Height = 13
            Caption = 'C'#243'd. Pedido'
          end
          object Label2: TLabel
            Left = 135
            Top = 16
            Width = 64
            Height = 13
            Caption = 'Data Emiss'#227'o'
          end
          object Label3: TLabel
            Left = 225
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object edCliente: TDBLookupComboBox
            Left = 224
            Top = 32
            Width = 481
            Height = 21
            KeyField = 'idcliente'
            ListField = 'nome'
            ListSource = dtCliente
            TabOrder = 0
          end
          object edCodigo: TEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 1
            Text = 'edCodigo'
          end
          object edDataEmissao: TDateTimePicker
            Left = 135
            Top = 32
            Width = 82
            Height = 21
            Date = 44139.331340717600000000
            Time = 44139.331340717600000000
            TabOrder = 2
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 553
          Width = 1065
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            Left = 849
            Top = 18
            Width = 73
            Height = 13
            Caption = 'Total Pedido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btIncluir: TButton
            Left = 8
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Incluir'
            TabOrder = 0
            OnClick = btIncluirClick
          end
          object btSalvar: TButton
            Left = 82
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btSalvarClick
          end
          object edValorTotal: TEdit
            Left = 928
            Top = 14
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object btCarregarPedido: TButton
            Left = 192
            Top = 9
            Width = 105
            Height = 25
            Caption = 'Carregar Pedido'
            TabOrder = 3
            OnClick = btCarregarPedidoClick
          end
          object btCancelarPedido: TButton
            Left = 296
            Top = 9
            Width = 105
            Height = 25
            Caption = 'Cancelar Pedido'
            TabOrder = 4
            OnClick = btCancelarPedidoClick
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 81
          Width = 1065
          Height = 472
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 1065
            Height = 19
            Align = alTop
            Alignment = taCenter
            Caption = 'Itens do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 128
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 19
            Width = 1016
            Height = 453
            Align = alClient
            DataSource = dtPedidoItem
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGrid1KeyDown
            OnKeyPress = DBGrid1KeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'idpedidoproduto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'idpedido'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'idproduto'
                Title.Caption = 'C'#243'd. Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Caption = 'Produto'
                Width = 275
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorunit'
                Title.Caption = 'Valor Unit.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valortotalproduto'
                Title.Caption = 'Valor Total'
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 1016
            Top = 19
            Width = 49
            Height = 453
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object Button1: TButton
              Left = 16
              Top = 6
              Width = 33
              Height = 25
              Caption = '+'
              TabOrder = 0
              OnClick = Button1Click
            end
          end
        end
      end
    end
  end
  object dtPedidoVenda: TDataSource
    DataSet = restPedidoVenda
    Left = 528
    Top = 96
  end
  object dtCliente: TDataSource
    DataSet = restCliente
    Left = 744
    Top = 48
  end
  object dtPedidoItem: TDataSource
    DataSet = restPedidoItem
    Left = 608
    Top = 96
  end
  object restPedidoVenda: TADODataSet
    Connection = DataModuleWK.ADOConnectionwk
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = restPedidoVendaAfterScroll
    CommandText = 
      'SELECT p.idpedido,'#13#10'    p.dataemissao,'#13#10'    p.idcliente,'#13#10'    p.' +
      'valortotal,'#13#10'    c.nome'#13#10#13#10'FROM cadpedido p'#13#10#13#10'left join cadclie' +
      'nte c on p.idcliente = c.idcliente'#13#10#13#10'order by  p.idpedido'
    Parameters = <>
    Prepared = True
    Left = 536
    Top = 47
    object restPedidoVendaidpedido: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idpedido'
      KeyFields = 'idpedido'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object restPedidoVendadataemissao: TDateField
      FieldName = 'dataemissao'
    end
    object restPedidoVendaidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object restPedidoVendavalortotal: TBCDField
      FieldName = 'valortotal'
      DisplayFormat = 'R$,0.00'
      Precision = 18
      Size = 2
    end
    object restPedidoVendanome: TStringField
      FieldName = 'nome'
      Size = 200
    end
  end
  object restCliente: TADODataSet
    Connection = DataModuleWK.ADOConnectionwk
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT C.idcliente,'#10'    C.nome,'#10'    C.cidade,'#10'    C.uf'#13#10'FROM cad' +
      'cliente C'#13#10#10'order by C.nome'
    Parameters = <>
    Left = 696
    Top = 47
    object restClienteidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object restClientenome: TStringField
      FieldName = 'nome'
      Size = 200
    end
    object restClientecidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object restClienteuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
  object restPedidoItem: TADODataSet
    Connection = DataModuleWK.ADOConnectionwk
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT pp.idpedidoproduto, '#13#10'pp.idpedido,'#13#10'pp.idproduto,'#13#10'pp.qua' +
      'ntidade,'#13#10'pp.valorunit,'#13#10'pp.valortotalproduto,'#13#10'p.descricao as p' +
      'roduto'#13#10'FROM cadpedidoproduto pp'#13#10'left join cadproduto p on pp.i' +
      'dproduto = p.idproduto'#13#10'where pp.idpedido = :vidpedido '#13#10'order b' +
      'y pp.idpedido, pp.idpedidoproduto'
    Parameters = <
      item
        Name = 'vidpedido'
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 600
    Top = 47
    object restPedidoItemidpedidoproduto: TAutoIncField
      FieldName = 'idpedidoproduto'
      ReadOnly = True
    end
    object restPedidoItemidpedido: TIntegerField
      FieldName = 'idpedido'
    end
    object restPedidoItemidproduto: TIntegerField
      FieldName = 'idproduto'
    end
    object restPedidoItemquantidade: TBCDField
      FieldName = 'quantidade'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object restPedidoItemvalorunit: TBCDField
      FieldName = 'valorunit'
      DisplayFormat = 'R$,0.00'
      Precision = 18
      Size = 2
    end
    object restPedidoItemvalortotalproduto: TBCDField
      FieldName = 'valortotalproduto'
      DisplayFormat = 'R$,0.00'
      Precision = 18
      Size = 2
    end
    object restPedidoItemproduto: TStringField
      FieldName = 'produto'
      Size = 150
    end
  end
  object restID: TADODataSet
    Connection = DataModuleWK.ADOConnectionwk
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = restPedidoVendaAfterScroll
    CommandText = 'select last_insert_id() as codigo'
    Parameters = <>
    Prepared = True
    Left = 408
    Top = 47
    object restIDcodigo: TLargeintField
      FieldName = 'codigo'
      ReadOnly = True
    end
  end
end
