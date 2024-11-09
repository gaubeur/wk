object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio de Pedido'
  ClientHeight = 419
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object spbtnselecionarcliente: TSpeedButton
    Left = 87
    Top = 38
    Width = 57
    Height = 25
    Cursor = crHandPoint
    Hint = 'Clique aqui para selecionar um cliente'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spbtnselecionarclienteClick
  end
  object spbtnselecionarproduto: TSpeedButton
    Left = 87
    Top = 95
    Width = 57
    Height = 25
    Cursor = crHandPoint
    Hint = 'Clique aqui para selecionar um produto'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spbtnselecionarprodutoClick
  end
  object lblnmcliente: TLabel
    Left = 152
    Top = 40
    Width = 48
    Height = 19
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbldescricaoproduto: TLabel
    Left = 150
    Top = 95
    Width = 56
    Height = 19
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 254
    Top = 393
    Width = 152
    Height = 19
    Caption = 'Valor Total Lan'#231'ado :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblvlrtotal: TLabel
    Left = 429
    Top = 393
    Width = 56
    Height = 19
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object spbtngravarpedido: TSpeedButton
    Left = 372
    Top = 24
    Width = 145
    Height = 25
    Cursor = crHandPoint
    Hint = 'Clique aqui para Gravar o Pedido'
    Caption = 'Gravar Pedido'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333FF33333333FF333993333333300033377F3333333777333993333333
      300033F77FFF3333377739999993333333333777777F3333333F399999933333
      33003777777333333377333993333333330033377F3333333377333993333333
      3333333773333333333F333333333333330033333333F33333773333333C3333
      330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
      333333333337733333FF3333333C333330003333333733333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spbtngravarpedidoClick
  end
  object spbtnconsultarpedido: TSpeedButton
    Left = 372
    Top = 61
    Width = 145
    Height = 25
    Cursor = crHandPoint
    Hint = 'Clique aqui para consultar um pedido'
    Caption = 'Consultar o Pedido'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spbtnconsultarpedidoClick
  end
  object spbtncancelarpedido: TSpeedButton
    Left = 372
    Top = 101
    Width = 145
    Height = 25
    Cursor = crHandPoint
    Hint = 'Clique aqui para Cancelar um Pedido'
    Caption = 'Cancelar o Pedido'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
      993337777F777F3377F3393999707333993337F77737333337FF993399933333
      399377F3777FF333377F993339903333399377F33737FF33377F993333707333
      399377F333377FF3377F993333101933399377F333777FFF377F993333000993
      399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
      99333773FF777F777733339993707339933333773FF7FFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spbtncancelarpedidoClick
  end
  object lbledtcodcliente: TLabeledEdit
    Left = 16
    Top = 40
    Width = 65
    Height = 21
    EditLabel.Width = 132
    EditLabel.Height = 19
    EditLabel.Hint = 'Informe o C'#243'digo do Cliente que deseja realizar o Pedido'
    EditLabel.Caption = 'C'#243'digo do Cliente:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    NumbersOnly = True
    TabOrder = 0
    OnExit = lbledtcodclienteExit
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 132
    Width = 505
    Height = 105
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Item do Pedido:'
      object spbtnincluiritempedido: TSpeedButton
        Left = 280
        Top = 32
        Width = 57
        Height = 25
        Cursor = crHandPoint
        Hint = 'Clique aqui para inserir o item do pedido'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spbtnincluiritempedidoClick
      end
      object lbledtquantidade: TLabeledEdit
        Left = 35
        Top = 32
        Width = 65
        Height = 21
        EditLabel.Width = 87
        EditLabel.Height = 19
        EditLabel.Caption = 'Quantidade:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -16
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        TabOrder = 0
      end
      object lbledtvalorunitario: TLabeledEdit
        Left = 189
        Top = 32
        Width = 65
        Height = 21
        EditLabel.Width = 104
        EditLabel.Height = 19
        EditLabel.Caption = 'Valor Unit'#225'rio:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -16
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        TabOrder = 1
      end
    end
  end
  object DBGriditemPedido: TDBGrid
    Left = 20
    Top = 248
    Width = 497
    Height = 137
    DataSource = DSPedidoIem
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = DBGriditemPedidoKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'produto'
        Title.Caption = 'C'#243'd.Produto'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 105
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
        FieldName = 'vlrunitario'
        Title.Caption = 'Valor Unit'#225'rio(R$)'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlrtotal'
        Title.Caption = 'Valor Total(R$)'
        Width = 131
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 20
    Top = 392
    Width = 224
    Height = 25
    Hint = 'Utilize a barra para navegar entre os registros'
    DataSource = DSPedidoIem
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'ir para o primeiro registro'
      'ir para o '#250'ltiom registro'
      'ir para o pr'#243'ximo registro'
      'ir para o '#250'ltiimo registro')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object lbledtcodproduto: TLabeledEdit
    Left = 16
    Top = 97
    Width = 65
    Height = 21
    EditLabel.Width = 140
    EditLabel.Height = 19
    EditLabel.Caption = 'C'#243'digo do Produto:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    NumbersOnly = True
    TabOrder = 4
  end
  object DSPedidoIem: TDataSource
    DataSet = CDSitemPedido
    Left = 392
    Top = 304
  end
  object CDSitemPedido: TClientDataSet
    PersistDataPacket.Data = {
      9F0000009619E0BD0100000018000000070000000000030000009F000770726F
      6475746F04000100000000000964657363726963616F01004900000001000557
      494454480200020023000A7175616E74696461646508000400000000000B766C
      72756E69746172696F080004000000000008766C72746F74616C080004000000
      000007636C69656E746504000100000000000670656469646F04000100000000
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 304
    object CDSitemPedidoproduto: TIntegerField
      FieldName = 'produto'
    end
    object CDSitemPedidodescricao: TStringField
      FieldName = 'descricao'
      Size = 35
    end
    object CDSitemPedidoquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object CDSitemPedidovlrunitario: TFloatField
      FieldName = 'vlrunitario'
      DisplayFormat = 'R$ 0.00'
    end
    object CDSitemPedidovlrtotal: TFloatField
      FieldName = 'vlrtotal'
      DisplayFormat = 'R$ 0.00'
    end
    object CDSitemPedidocliente: TIntegerField
      FieldName = 'cliente'
    end
    object CDSitemPedidopedido: TIntegerField
      FieldName = 'pedido'
    end
  end
end
