object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  ActiveControl = edtUsuario
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o do sistema'
  ClientHeight = 184
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 13
    Top = 18
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 163
    Top = 15
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object lblgbd: TLabel
    Left = 13
    Top = 63
    Width = 78
    Height = 13
    Caption = 'Arquivo gdn/fdb'
  end
  object edtUsuario: TEdit
    Left = 13
    Top = 34
    Width = 144
    Height = 21
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 163
    Top = 34
    Width = 157
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtGdb: TEdit
    Left = 13
    Top = 82
    Width = 226
    Height = 21
    TabOrder = 2
  end
  object btnCancelar: TBitBtn
    Left = 245
    Top = 139
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 
      'Cancelar confirura'#231#227'o do sistema|Cancelar confirura'#231#227'o do sistem' +
      'a'
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object btnSalvar: TBitBtn
    Left = 164
    Top = 139
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Gravar as configura'#231#245'es'
    Caption = '&OK'
    Default = True
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
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnProcurar: TButton
    Left = 245
    Top = 80
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Procurar o Banco de Dados, :0'
    Caption = 'Procurar...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnProcurarClick
  end
  object dlgArquivo: TOpenDialog
    Filter = 'Firebird   *.gdb;*.fdb|*.gdb;*.fdb|Todos  *.*|*.*'
    FilterIndex = 0
    Title = 'Selecione um gdb'
    Left = 115
    Top = 122
  end
end
