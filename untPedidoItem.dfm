object frmPedidoItem: TfrmPedidoItem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  BorderWidth = 10
  Caption = 'frmPedidoItem'
  ClientHeight = 198
  ClientWidth = 793
  Color = 9145227
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = 4105706
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
    object Label7: TLabel
      Left = 7
      Top = 5
      Width = 137
      Height = 23
      Caption = 'ITENS PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 750
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
    Width = 793
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 64
      Height = 13
      Caption = 'C'#243'd. Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 95
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 62
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 62
      Width = 50
      Height = 13
      Caption = 'Valor Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 248
      Top = 62
      Width = 51
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edCodigo: TEdit
      Left = 8
      Top = 31
      Width = 81
      Height = 21
      TabOrder = 0
      OnExit = edCodigoExit
    end
    object edDescricao: TEdit
      Left = 95
      Top = 31
      Width = 546
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edQuantidade: TEdit
      Left = 8
      Top = 79
      Width = 114
      Height = 21
      TabOrder = 2
      OnExit = edQuantidadeExit
    end
    object edValorUnit: TEdit
      Left = 128
      Top = 79
      Width = 114
      Height = 21
      TabOrder = 3
      OnExit = edValorUnitExit
    end
    object edValorTotal: TEdit
      Left = 248
      Top = 79
      Width = 114
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object Panel3: TPanel
      Left = 0
      Top = 125
      Width = 793
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      object Button1: TButton
        Left = 14
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
end
