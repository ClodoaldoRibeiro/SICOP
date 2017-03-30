object dmDados: TdmDados
  OldCreateOrder = False
  Height = 415
  Width = 463
  object conconexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Protocol=TCPIP'
      
        'Database=D:\Clodoaldo\Desenvolvimento de Software\Projetos\Ponto' +
        '\dados\PRONTO.GDB'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 21
    Top = 8
  end
  object FDQuery: TFDQuery
    Connection = conconexao
    SQL.Strings = (
      'SELECT * FROM PONTBTPF')
    Left = 245
    Top = 8
  end
  object IBDriverLink: TFDPhysIBDriverLink
    Left = 100
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 8
  end
  object DataSetProvider: TDataSetProvider
    DataSet = FDQuery
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 322
    Top = 9
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 22
    Top = 113
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 23
    Top = 65
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 394
    Top = 10
  end
  object cdsPONTBBAT: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM PONTBBAT'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 94
    Top = 112
  end
  object cdsPONTBCON: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 243
    Top = 111
  end
  object cdsPONTBEND: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 319
    Top = 111
  end
  object cdsPONTBFER: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM PONTBFER'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 392
    Top = 111
    object intgrfldPONTBFERPON_PK_SEQ_FER: TIntegerField
      FieldName = 'PON_PK_SEQ_FER'
      Origin = 'PON_PK_SEQ_FER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPONTBFERPON_DESC_FER: TStringField
      FieldName = 'PON_DESC_FER'
      Origin = 'PON_DESC_FER'
      Size = 60
    end
    object intgrfldPONTBFERPON_FK_TPF_FER: TIntegerField
      FieldName = 'PON_FK_TPF_FER'
      Origin = 'PON_FK_TPF_FER'
      Required = True
    end
    object cdsPONTBFERPON_DATA_FER: TDateField
      FieldName = 'PON_DATA_FER'
      Origin = 'PON_DATA_FER'
    end
  end
  object cdsPONTBFUN: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM PONTBFUN'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 22
    Top = 217
    object intgrfldPONTBFUNPON_PK_SEQ_FUN: TIntegerField
      FieldName = 'PON_PK_SEQ_FUN'
      Origin = 'PON_PK_SEQ_FUN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPONTBFUNPON_NOME_FUN: TStringField
      FieldName = 'PON_NOME_FUN'
      Origin = 'PON_NOME_FUN'
      Size = 60
    end
    object cdsPONTBFUNPON_CPF_FUN: TStringField
      FieldName = 'PON_CPF_FUN'
      Origin = 'PON_CPF_FUN'
      Size = 11
    end
    object cdsPONTBFUNPON_DATANASC_FUN: TDateField
      FieldName = 'PON_DATANASC_FUN'
      Origin = 'PON_DATANASC_FUN'
    end
    object cdsPONTBFUNPON_CELULAR_FUN: TStringField
      FieldName = 'PON_CELULAR_FUN'
      Origin = 'PON_CELULAR_FUN'
      Size = 12
    end
    object cdsPONTBFUNPON_EMAIL_FUN: TStringField
      FieldName = 'PON_EMAIL_FUN'
      Origin = 'PON_EMAIL_FUN'
      Size = 60
    end
    object cdsPONTBFUNPON_TEL_FUN: TStringField
      FieldName = 'PON_TEL_FUN'
      Origin = 'PON_TEL_FUN'
      Size = 10
    end
    object cdsPONTBFUNPON_CEP_FUN: TStringField
      FieldName = 'PON_CEP_FUN'
      Origin = 'PON_CEP_FUN'
      Size = 8
    end
    object cdsPONTBFUNPON_ESTADO_FUN: TStringField
      FieldName = 'PON_ESTADO_FUN'
      Origin = 'PON_ESTADO_FUN'
      FixedChar = True
      Size = 2
    end
    object cdsPONTBFUNPON_CIDADE_FUN: TStringField
      FieldName = 'PON_CIDADE_FUN'
      Origin = 'PON_CIDADE_FUN'
      Size = 60
    end
    object cdsPONTBFUNPON_BAIRRO_FUN: TStringField
      FieldName = 'PON_BAIRRO_FUN'
      Origin = 'PON_BAIRRO_FUN'
      Size = 60
    end
    object cdsPONTBFUNPON_ENDERECO_FUN: TStringField
      FieldName = 'PON_ENDERECO_FUN'
      Origin = 'PON_ENDERECO_FUN'
      Size = 60
    end
    object intgrfldPONTBFUNPON_BATMANHA_FUN: TIntegerField
      FieldName = 'PON_BATMANHA_FUN'
      Origin = 'PON_BATMANHA_FUN'
    end
    object intgrfldPONTBFUNPON_BATTARDE_FUN: TIntegerField
      FieldName = 'PON_BATTARDE_FUN'
      Origin = 'PON_BATTARDE_FUN'
    end
  end
  object cdsPONTBPFL: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM PONTBPFL'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 93
    Top = 217
    object cdsPONTBPFLPON_PK_SEQ_PFL: TIntegerField
      FieldName = 'PON_PK_SEQ_PFL'
      Origin = 'PON_PK_SEQ_PFL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPONTBPFLPON_DESC_PFL: TStringField
      FieldName = 'PON_DESC_PFL'
      Origin = 'PON_DESC_PFL'
      Size = 60
    end
    object cdsPONTBPFLPON_ADM_PFL: TBooleanField
      FieldName = 'PON_ADM_PFL'
      Origin = 'PON_ADM_PFL'
    end
  end
  object cdsPONTBPON: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 166
    Top = 216
  end
  object cdsPONTBTPF: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM PONTBTPF'
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 170
    Top = 112
    object cdsPONTBTPFPON_PK_SEQ_TPF: TIntegerField
      FieldName = 'PON_PK_SEQ_TPF'
      Origin = 'PON_PK_SEQ_TPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPONTBTPFPON_DESC_TPF: TStringField
      FieldName = 'PON_DESC_TPF'
      Origin = 'PON_DESC_TPF'
      Size = 60
    end
  end
  object cdsPONTBUSE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 240
    Top = 216
  end
  object dsPONTBBAT: TDataSource
    DataSet = cdsPONTBBAT
    Left = 97
    Top = 65
  end
  object dsPONTBTPF: TDataSource
    DataSet = cdsPONTBTPF
    Left = 172
    Top = 67
  end
  object dsPONTBCON: TDataSource
    DataSet = cdsPONTBCON
    Left = 245
    Top = 66
  end
  object dsPONTBEND: TDataSource
    DataSet = cdsPONTBEND
    Left = 320
    Top = 65
  end
  object dsPONTBFER: TDataSource
    DataSet = cdsPONTBFER
    Left = 393
    Top = 65
  end
  object dsPONTBFUN: TDataSource
    DataSet = cdsPONTBFUN
    Left = 22
    Top = 169
  end
  object dsPONTBPFL: TDataSource
    DataSet = cdsPONTBPFL
    Left = 94
    Top = 169
  end
  object dsPONTBPON: TDataSource
    DataSet = cdsPONTBPON
    Left = 167
    Top = 171
  end
  object dsPONTBUSE: TDataSource
    DataSet = cdsPONTBUSE
    Left = 240
    Top = 172
  end
end
