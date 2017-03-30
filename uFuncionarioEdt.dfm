object frmFuncionarioEdt: TfrmFuncionarioEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Editar funcion'#225'rio'
  ClientHeight = 321
  ClientWidth = 436
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
    Top = 280
    Width = 436
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
    DesignSize = (
      436
      41)
    object btnFechar: TBitBtn
      Left = 349
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
      Left = 267
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
  object pgcCorpo: TPageControl
    Left = 0
    Top = 0
    Width = 436
    Height = 280
    ActivePage = tsHorarioPonto
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object tsDadosPessoais: TTabSheet
      Caption = 'Dados Pessoais'
      object pnlControle: TPanel
        Left = 0
        Top = 0
        Width = 428
        Height = 249
        Align = alClient
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object gpDadospessoai: TGroupBox
          Left = 1
          Top = 1
          Width = 426
          Height = 247
          Align = alClient
          Caption = 'Dados Pessoais'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lb2: TLabel
            Left = 21
            Top = 30
            Width = 38
            Height = 19
            Caption = 'Nome'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object lb3: TLabel
            Left = 21
            Top = 87
            Width = 130
            Height = 19
            Caption = 'Data de nascimento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object lb4: TLabel
            Left = 270
            Top = 87
            Width = 24
            Height = 19
            Caption = 'CPF'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object edtPON_NOME_FUN: TEdit
            Left = 21
            Top = 55
            Width = 353
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object mePON_CPF_FUN: TMaskEdit
            Left = 270
            Top = 106
            Width = 104
            Height = 23
            Alignment = taCenter
            EditMask = '999.999.999-99;0;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            MaxLength = 14
            ParentFont = False
            TabOrder = 2
            Text = ''
            OnExit = mePON_CPF_FUNExit
          end
          object edtPON_DATANASC_FUN: TEvDateEdit
            Left = 21
            Top = 106
            Width = 130
            Height = 23
            DateText = '00/00/0000'
            DateValue = -693594.000000000000000000
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            Glyph.Data = {
              7E050000424D7E0500000000000036000000280000001A0000000D0000000100
              2000000000004805000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00AA927A00A48C74009B836B00947C64008D755D00856D55007E66
              4E00765E46006F573F00674F370060483000FF00FF00FF00FF00A2A2A2009C9C
              9C00949494008E8E8E00878787008080800079797900717171006B6B6B006262
              62005B5B5B00FF00FF00FF00FF00B1998100D0B8A000B0887000E0B8A000B090
              7000E0B8A000B0887000D0B8A000B0887000D0A89000674F3700FF00FF00FF00
              FF00A8A8A800C2C2C2009B9B9B00C4C4C4009E9E9E00C4C4C4009B9B9B00C2C2
              C2009B9B9B00B6B6B60062626200FF00FF00FF00FF00B79F8700FFFFFF00D0A8
              9000FFFFFF00D0A08000FFF8F000D0A08000FFE8E000D0A08000FFE0D0006F57
              3F00FF00FF00FF00FF00ADADAD00FFFFFF00B6B6B600FFFFFF00AEAEAE00F8F8
              F800AEAEAE00EDEDED00AEAEAE00E5E5E5006B6B6B00FF00FF00FF00FF00BDA5
              8D00D0B09000B0887000D0A08000B0887000D0A080001040E0001038E0000030
              B000D0A08000765E4600FF00FF00FF00FF00B2B2B200BABABA009B9B9B00AEAE
              AE009B9B9B00AEAEAE00828282007E7E7E006A6A6A00AEAEAE0071717100FF00
              FF00FF00FF00C3AB9300FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF006080
              FF00FFFFFF001038E000FFE8E0007E664E00FF00FF00FF00FF00B7B7B700FFFF
              FF00AEAEAE00FFFFFF00AEAEAE00FFFFFF00B4B4B400FFFFFF007E7E7E00EDED
              ED0079797900FF00FF00FF00FF00CAB29A00D0B09000B0887000D0A08000B088
              7000D0A080008098FF006080FF001040E000D0A08000856D5500FF00FF00FF00
              FF00BDBDBD00BABABA009B9B9B00AEAEAE009B9B9B00AEAEAE00C3C3C300B4B4
              B40082828200AEAEAE0080808000FF00FF00FF00FF00D0B8A000FFFFFF00D0A0
              8000FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF00D0A08000FFF8F0008D75
              5D00FF00FF00FF00FF00C2C2C200FFFFFF00AEAEAE00FFFFFF00AEAEAE00FFFF
              FF00AEAEAE00FFFFFF00AEAEAE00F8F8F80087878700FF00FF00FF00FF00ECA1
              8700E89C8000E3947600DF8F7000DC8A6900D9866300D5805A00D0795100CB72
              4800C66B3F00C2653600FF00FF00FF00FF00B3B3B300AEAEAE00A7A7A700A3A3
              A3009E9E9E009A9A9A00939393008D8D8D00868686007F7F7F0079797900FF00
              FF00FF00FF00EFA58D00FFE8E000FFE8E000FFE8E000FFE8E000FFE8E000F0A0
              8000F0A08000F0A08000F0A07000C66B3F00FF00FF00FF00FF00B6B6B600EDED
              ED00EDEDED00EDEDED00EDEDED00EDEDED00B1B1B100B1B1B100B1B1B100ADAD
              AD007F7F7F00FF00FF00FF00FF00F0A89000EFA58D00ECA18700E89C8000E394
              7600DF8F7000DC8A6900D9866300D5805A00D0795100CB724800FF00FF00FF00
              FF00B9B9B900B6B6B600B3B3B300AEAEAE00A7A7A700A3A3A3009E9E9E009A9A
              9A00939393008D8D8D0086868600FF00FF00FF00FF00D0B8A000494F4900FFFF
              FF00494F4900FFFFFF00494F4900FFFFFF00494F4900FFFFFF00494F4900D0B8
              A000FF00FF00FF00FF00C2C2C20064646400FFFFFF0064646400FFFFFF006464
              6400FFFFFF0064646400FFFFFF0064646400C2C2C200FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00}
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object tsEndereco: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object gpEndereco: TGroupBox
        Left = 0
        Top = 0
        Width = 428
        Height = 249
        Align = alClient
        Caption = 'Endere'#231'o'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object lb8: TLabel
          Left = 21
          Top = 30
          Width = 25
          Height = 19
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb9: TLabel
          Left = 266
          Top = 23
          Width = 17
          Height = 19
          Caption = 'UF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb10: TLabel
          Left = 21
          Top = 80
          Width = 45
          Height = 19
          Caption = 'Cidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb11: TLabel
          Left = 21
          Top = 128
          Width = 39
          Height = 19
          Caption = 'Bairro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb12: TLabel
          Left = 20
          Top = 176
          Width = 60
          Height = 19
          Caption = 'Endere'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object edPON_CIDADE_FUN: TEdit
          Left = 21
          Top = 99
          Width = 353
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object mePON_CEP_FUN: TMaskEdit
          Left = 21
          Top = 48
          Width = 66
          Height = 23
          Alignment = taCenter
          EditMask = '00000\-999;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object cbbPON_ESTADO_FUN: TComboBox
          Left = 269
          Top = 48
          Width = 105
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'Selecioane...'
          Items.Strings = (
            'Selecioane...'
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RN'
            'RS'
            'RJ'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
        end
        object edPON_BAIRRO_FUN: TEdit
          Left = 21
          Top = 147
          Width = 353
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edPON_ENDERECO_FUN: TEdit
          Left = 21
          Top = 195
          Width = 353
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object tsContato: TTabSheet
      Caption = 'Contato'
      ImageIndex = 2
      object gpContato: TGroupBox
        Left = 0
        Top = 0
        Width = 428
        Height = 249
        Align = alClient
        Caption = 'Contato'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object lb5: TLabel
          Left = 21
          Top = 30
          Width = 46
          Height = 19
          Caption = 'Celular'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb7: TLabel
          Left = 21
          Top = 80
          Width = 41
          Height = 19
          Caption = 'E-mail'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb13: TLabel
          Left = 274
          Top = 30
          Width = 56
          Height = 19
          Caption = 'Telefone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object edPON_EMAIL_FUN: TEdit
          Left = 21
          Top = 99
          Width = 353
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object mePON_CELULAR_FUN: TMaskEdit
          Left = 21
          Top = 51
          Width = 100
          Height = 23
          Alignment = taCenter
          EditMask = '!\(00\) 00000-0000;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object mePON_TEL_FUN: TMaskEdit
          Left = 274
          Top = 51
          Width = 92
          Height = 23
          Alignment = taCenter
          EditMask = '!\(00\) 0000-0000;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 1
          Text = ''
        end
      end
    end
    object tsHorarioPonto: TTabSheet
      Caption = 'Hor'#225'rio de ponto'
      ImageIndex = 3
      object gp1: TGroupBox
        Left = 0
        Top = 0
        Width = 428
        Height = 249
        Align = alClient
        Caption = 'Contato'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object lb1: TLabel
          Left = 37
          Top = 30
          Width = 107
          Height = 19
          Caption = 'Hor'#225'rio de inic'#237'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lb14: TLabel
          Left = 263
          Top = 30
          Width = 80
          Height = 19
          Caption = 'Hor'#225'rio final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object lstHorarioInicial: TListBox
          Left = 18
          Top = 55
          Width = 141
          Height = 154
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsItalic]
          ItemHeight = 18
          ParentFont = False
          TabOrder = 0
        end
        object lstHorarioFinal: TListBox
          Left = 230
          Top = 55
          Width = 144
          Height = 154
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsItalic]
          ItemHeight = 18
          ParentFont = False
          TabOrder = 1
        end
        object dblst1: TDBListBox
          Left = 218
          Top = 64
          Width = 121
          Height = 97
          DataSource = dmDados.dsPONTBBAT
          ItemHeight = 19
          TabOrder = 2
        end
      end
    end
  end
end
