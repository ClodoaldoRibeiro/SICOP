object frmFeriadoEdt: TfrmFeriadoEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFeriadoEdt'
  ClientHeight = 210
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 169
    Width = 396
    Height = 41
    Align = alBottom
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 175
    DesignSize = (
      396
      41)
    object btnFechar: TBitBtn
      Left = 309
      Top = 6
      Width = 76
      Height = 25
      Cursor = crHandPoint
      Hint = 'Cancelar opera'#231#227'o ^^'
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnOK: TBitBtn
      Left = 227
      Top = 6
      Width = 76
      Height = 25
      Cursor = crHandPoint
      Hint = 'Grave a opra'#231#227'o .;'
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnlControle: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 169
    Align = alClient
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object lblDescrição: TLabel
      Left = 8
      Top = 90
      Width = 64
      Height = 19
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object lblData: TLabel
      Left = 8
      Top = 23
      Width = 92
      Height = 19
      Caption = 'Dia do feriado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object lblTipoFeriado: TLabel
      Left = 173
      Top = 23
      Width = 98
      Height = 19
      Caption = 'Tipo de feriado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object edtDescricao: TEdit
      Left = 8
      Top = 115
      Width = 377
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dtpDate: TDateTimePicker
      AlignWithMargins = True
      Left = 8
      Top = 48
      Width = 113
      Height = 23
      Cursor = crHandPoint
      Hint = 'Escolha a data de feriado'
      Date = 42636.000000000000000000
      Time = 42636.000000000000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbbTipoFeriado: TComboBox
      Left = 173
      Top = 48
      Width = 212
      Height = 23
      Cursor = crHandPoint
      Hint = 'Selelcione  o tipo de feriado'
      AutoDropDown = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'Selecione...'
    end
  end
end
