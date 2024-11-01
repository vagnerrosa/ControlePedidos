object frmPedidosView: TfrmPedidosView
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Pedidos'
  ClientHeight = 732
  ClientWidth = 1218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 20
  object pnlLinhaRodape: TPanel
    Left = 0
    Top = 720
    Width = 1218
    Height = 12
    Align = alBottom
    BevelOuter = bvNone
    Color = 14581528
    ParentBackground = False
    TabOrder = 0
  end
  object pnlBackground: TPanel
    Left = 0
    Top = 161
    Width = 1218
    Height = 495
    Align = alClient
    BevelOuter = bvNone
    Color = 5395026
    ParentBackground = False
    TabOrder = 1
    object pnlConsultaProduto: TPanel
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 300
      Height = 455
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblNomeProduto: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 92
        Width = 201
        Height = 30
        Margins.Left = 10
        Margins.Top = 20
        Caption = 'NOME DO PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblQTD: TLabel
        Left = 34
        Top = 160
        Width = 37
        Height = 25
        Caption = 'Qtd '
        Font.Charset = ANSI_CHARSET
        Font.Color = 5395026
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVlrUnitario: TLabel
        Left = 177
        Top = 160
        Width = 98
        Height = 25
        Caption = 'Vlr Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = 5395026
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigoBarras: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 176
        Height = 30
        Alignment = taCenter
        Caption = 'C'#243'digo do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlRodapeGrava: TPanel
        Left = 0
        Top = 380
        Width = 300
        Height = 75
        Align = alBottom
        BevelOuter = bvNone
        Color = 7434609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        object BtnGravarPedido: TBitBtn
          Left = 49
          Top = 24
          Width = 199
          Height = 49
          Caption = 'Gravar Pedido'
          TabOrder = 0
          StyleElements = []
          OnClick = BtnGravarPedidoClick
        end
      end
      object edtVlrUnitario: TEdit
        Left = 177
        Top = 191
        Width = 118
        Height = 33
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '0,00'
        OnKeyPress = edtVlrUnitarioKeyPress
      end
      object edtQTD: TEdit
        Left = 10
        Top = 191
        Width = 73
        Height = 33
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
        Text = '1'
      end
      object edtCodigoProduto: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 36
        Width = 298
        Height = 51
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Alignment = taCenter
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -33
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodigoProdutoExit
      end
      object btnAdicionar: TBitBtn
        Left = 48
        Top = 256
        Width = 200
        Height = 62
        Caption = 'Confirma Dados'
        TabOrder = 3
        StyleElements = []
        OnClick = btnAdicionarClick
      end
    end
    object pnlListaProdutos: TPanel
      AlignWithMargins = True
      Left = 340
      Top = 20
      Width = 858
      Height = 455
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object pnlTotalPagar: TPanel
        Left = 0
        Top = 380
        Width = 858
        Height = 75
        Align = alBottom
        BevelOuter = bvNone
        Color = 14581528
        ParentBackground = False
        TabOrder = 1
        object lblTotalAPagar: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 30
          Width = 119
          Height = 42
          Margins.Top = 30
          Align = alLeft
          Caption = 'Total a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 30
        end
        object edtTotalAPagar: TEdit
          AlignWithMargins = True
          Left = 611
          Top = 10
          Width = 237
          Height = 62
          Margins.Top = 10
          Margins.Right = 10
          Align = alRight
          Alignment = taRightJustify
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 14581528
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -33
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
      end
      object DBG_produtos: TDBGrid
        AlignWithMargins = True
        Left = 10
        Top = 20
        Width = 838
        Height = 357
        Margins.Left = 10
        Margins.Top = 20
        Margins.Right = 10
        Align = alClient
        BorderStyle = bsNone
        DataSource = DsPedidoItem
        DrawingStyle = gdsGradient
        FixedColor = 5395026
        GradientEndColor = 5395026
        GradientStartColor = 5395026
        Font.Charset = ANSI_CHARSET
        Font.Color = 5460819
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgTabs, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI Semilight'
        TitleFont.Style = []
        OnKeyDown = DBG_produtosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo_produto'
            Title.Caption = 'C'#243'digo do Produto'
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeProduto'
            Title.Caption = 'Produto'
            Width = 375
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vir_unitario'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Unit'#225'rio do Item'
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vir_total'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Total do Item'
            Width = 168
            Visible = True
          end>
      end
    end
  end
  object pnlRodape: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 656
    Width = 1218
    Height = 62
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    Color = 3487029
    ParentBackground = False
    TabOrder = 2
    object pnlNovoPedido: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 10
      Width = 295
      Height = 50
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 0
      object sBtnNovoPedido: TSpeedButton
        Left = 0
        Top = -2
        Width = 217
        Height = 79
        Margins.Top = 5
        Caption = 'Novo Pedido ou Nova Busca'
        OnClick = sBtnNovoPedidoClick
      end
    end
    object pnlNumeroPedido: TPanel
      AlignWithMargins = True
      Left = 295
      Top = 10
      Width = 380
      Height = 50
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 1
      object lblPedido: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 20
        Width = 68
        Height = 27
        Margins.Top = 20
        Align = alLeft
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 30
      end
      object btnExcPedido: TSpeedButton
        Left = 256
        Top = 0
        Width = 124
        Height = 50
        Align = alRight
        Caption = 'Excluir o Pedido'
        OnClick = btnExcPedidoClick
        ExplicitTop = -2
      end
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1218
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    Color = 5395026
    ParentBackground = False
    TabOrder = 3
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 1218
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblTopo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 185
        Height = 58
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = 'Pedido   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -47
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 62
      end
      object SpeedButton1: TSpeedButton
        Left = 1098
        Top = 0
        Width = 120
        Height = 73
        Align = alRight
        Caption = 'X'
        OnClick = SpeedButton1Click
        ExplicitLeft = 904
      end
      object pnlBuscaPedido: TPanel
        AlignWithMargins = True
        Left = 198
        Top = 10
        Width = 347
        Height = 61
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 2
        Align = alLeft
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        object Label3: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 15
          Width = 128
          Height = 31
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alLeft
          Caption = 'Busca Pedido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 30
        end
        object sBtnBusca: TSpeedButton
          Left = 231
          Top = 8
          Width = 82
          Height = 41
          Margins.Top = 20
          Caption = 'Localizar'
          OnClick = sBtnBuscaClick
        end
        object EditNumeroPedido: TEdit
          Left = 159
          Top = 7
          Width = 66
          Height = 33
          Margins.Top = 30
          Margins.Bottom = 20
          Alignment = taCenter
          Font.Charset = ANSI_CHARSET
          Font.Color = clHighlight
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object pnlCliente: TPanel
      Left = 0
      Top = 73
      Width = 1218
      Height = 73
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 16
        Width = 177
        Height = 41
        Margins.Top = 15
        Margins.Bottom = 15
        Align = alLeft
        Caption = 'C'#243'digo do Cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 30
      end
      object lblNomeCliente: TLabel
        AlignWithMargins = True
        Left = 254
        Top = 17
        Width = 183
        Height = 30
        Margins.Left = 10
        Margins.Top = 20
        Caption = 'NOME DO CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 814
        Top = 17
        Width = 49
        Height = 30
        Margins.Left = 10
        Margins.Top = 20
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblData: TLabel
        AlignWithMargins = True
        Left = 886
        Top = 17
        Width = 44
        Height = 30
        Margins.Left = 10
        Margins.Top = 20
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodCLiente: TEdit
        Left = 187
        Top = 16
        Width = 54
        Height = 33
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodCLienteExit
      end
    end
  end
  object DsPedidoItem: TDataSource
    AutoEdit = False
    DataSet = mtbPedidoItem
    Left = 624
    Top = 304
  end
  object mtbPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 828
    Top = 301
    object mtbPedidonumero_pedido: TIntegerField
      FieldName = 'numero_pedido'
    end
    object mtbPedidodata_emissao: TDateField
      FieldName = 'data_emissao'
    end
    object mtbPedidocodigo_cliente: TIntegerField
      FieldName = 'codigo_cliente'
    end
    object mtbPedidovalor_total: TFloatField
      FieldName = 'valor_total'
      DisplayFormat = '###,###0.00'
    end
  end
  object mtbPedidoItem: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 732
    Top = 301
    object mtbPedidoItemid: TIntegerField
      FieldName = 'id'
    end
    object mtbPedidoItemnumero_pedido: TIntegerField
      FieldName = 'numero_pedido'
    end
    object mtbPedidoItemcodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
    end
    object mtbPedidoItemquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object mtbPedidoItemvir_unitario: TFloatField
      FieldName = 'vir_unitario'
      DisplayFormat = '###,###0.00'
    end
    object mtbPedidoItemvir_total: TFloatField
      FieldName = 'vir_total'
      DisplayFormat = '###,###0.00'
    end
    object mtbPedidoItemNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 50
    end
  end
end
