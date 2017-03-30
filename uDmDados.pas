 unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Comp.UI, Vcl.Controls, Datasnap.DBClient,
  Datasnap.Provider, Vcl.Dialogs;

type
  TdmDados = class(TDataModule)
    conconexao: TFDConnection;
    FDQuery: TFDQuery;
    IBDriverLink: TFDPhysIBDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    DataSetProvider: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dsPadrao: TDataSource;
    cdsConsulta: TClientDataSet;
    cdsPONTBBAT: TClientDataSet;
    cdsPONTBCON: TClientDataSet;
    cdsPONTBEND: TClientDataSet;
    cdsPONTBFER: TClientDataSet;
    cdsPONTBFUN: TClientDataSet;
    cdsPONTBPFL: TClientDataSet;
    cdsPONTBPON: TClientDataSet;
    cdsPONTBTPF: TClientDataSet;
    cdsPONTBUSE: TClientDataSet;
    dsPONTBBAT: TDataSource;
    dsPONTBTPF: TDataSource;
    dsPONTBCON: TDataSource;
    dsPONTBEND: TDataSource;
    dsPONTBFER: TDataSource;
    dsPONTBFUN: TDataSource;
    dsPONTBPFL: TDataSource;
    dsPONTBPON: TDataSource;
    dsPONTBUSE: TDataSource;
    cdsPONTBTPFPON_PK_SEQ_TPF: TIntegerField;
    cdsPONTBTPFPON_DESC_TPF: TStringField;
    cdsPONTBPFLPON_PK_SEQ_PFL: TIntegerField;
    cdsPONTBPFLPON_DESC_PFL: TStringField;
    cdsPONTBPFLPON_ADM_PFL: TBooleanField;
    intgrfldPONTBFERPON_PK_SEQ_FER: TIntegerField;
    cdsPONTBFERPON_DESC_FER: TStringField;
    intgrfldPONTBFERPON_FK_TPF_FER: TIntegerField;
    cdsPONTBFERPON_DATA_FER: TDateField;
    intgrfldPONTBFUNPON_PK_SEQ_FUN: TIntegerField;
    cdsPONTBFUNPON_NOME_FUN: TStringField;
    cdsPONTBFUNPON_CPF_FUN: TStringField;
    cdsPONTBFUNPON_DATANASC_FUN: TDateField;
    cdsPONTBFUNPON_CELULAR_FUN: TStringField;
    cdsPONTBFUNPON_EMAIL_FUN: TStringField;
    cdsPONTBFUNPON_TEL_FUN: TStringField;
    cdsPONTBFUNPON_CEP_FUN: TStringField;
    cdsPONTBFUNPON_ESTADO_FUN: TStringField;
    cdsPONTBFUNPON_CIDADE_FUN: TStringField;
    cdsPONTBFUNPON_BAIRRO_FUN: TStringField;
    cdsPONTBFUNPON_ENDERECO_FUN: TStringField;
    intgrfldPONTBFUNPON_BATMANHA_FUN: TIntegerField;
    intgrfldPONTBFUNPON_BATTARDE_FUN: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function setTFDConnection(var lcTFDConnection: TFDConnection): Boolean;
    function getAutorizacao(NomeTabela: string): Boolean;

    function carregarPONTBBAT: Boolean;
    function carregarPONTBFUN: Boolean;
  end;

var
  dmDados: TdmDados;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses uFuncoes, uConstates;

{$R *.dfm}
{ TdmDados }

{ TdmDados }

function TdmDados.getAutorizacao(NomeTabela: string): Boolean;
begin
    Result:= True;
end;

function TdmDados.setTFDConnection(var lcTFDConnection: TFDConnection): Boolean;
begin
  try
    lcTFDConnection.Close;
    lcTFDConnection.Params.Values['driverName'] :=  uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccDRIVERNAME);
    lcTFDConnection.Params.Values['user_name']  :=  uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccUSUARIO);
    lcTFDConnection.Params.Values['password']   :=  uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccSENHA);
    lcTFDConnection.Params.Values['database']   :=  uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccGDB);;
    lcTFDConnection.Open();
    Result := lcTFDConnection.Connected;
  except
    on e: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao abrir banco: ' + e.Message);
    end;
  end;
end;

function TdmDados.carregarPONTBBAT: Boolean;
  var
  ErroPadrao : Boolean;
begin
    ErroPadrao := False;
    try
      dmDados.cdsPONTBBAT.Close;
      dmDados.cdsPONTBBAT.CommandText := 'SELECT * FROM PONTBBAT ORDER BY PON_HORAINICIAL_BAT';
      dmDados.cdsPONTBBAT.Open;
    except on e: Exception do
      ErroPadrao := True;
    end;
    Result := ErroPadrao;
end;

function TdmDados.carregarPONTBFUN: Boolean;
  var
  ErroPadrao : Boolean;
begin
    ErroPadrao := False;
    try
      dmDados.cdsPONTBFUN.Close;
      dmDados.cdsPONTBFUN.CommandText := 'SELECT * FROM PONTBFUN';
      dmDados.cdsPONTBFUN.Open;
    except on e: Exception do
      ErroPadrao := True;
    end;
    Result := ErroPadrao;
end;
end.
