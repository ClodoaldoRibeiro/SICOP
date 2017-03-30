unit uTipoFeriado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppVar;

type
  TfrmTipoFeriado = class(TForm)
    ilPadrão: TImageList;
    tlb1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    dbgrdTipoFeriado: TDBGrid;
    edPesquisar: TEdit;
    ppDBPONTBTPF: TppDBPipeline;
    pprpPONTBTPF: TppReport;
    ppRe1: TppParameterList;
    btn1: TToolButton;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure AtualizaGrid;
    procedure CarregarDadosPONTBTPF();
    procedure edPesquisarClick(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure edPesquisarExit(Sender: TObject);
    procedure Pesquisar;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmTipoFeriado: TfrmTipoFeriado;

implementation

{$R *.dfm}

uses uDmDados, uTipoFeriadoEdt, uConstates;

procedure TfrmTipoFeriado.btnAlterarClick(Sender: TObject);
begin

  if dmDados.cdsPONTBTPF.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmTipoFeriadoEdt := TfrmTipoFeriadoEdt.Create(Application);
  try
    frmTipoFeriadoEdt.Operacao := OpAlterar;
    frmTipoFeriadoEdt.pPON_PK_SEQ_TPF := dmDados.cdsPONTBTPF.FieldByName('PON_PK_SEQ_TPF').AsInteger;
    frmTipoFeriadoEdt.ShowModal;
  finally
    frmTipoFeriadoEdt.Free;
  end;
end;

procedure TfrmTipoFeriado.btnExcluirClick(Sender: TObject);
begin
  if dmDados.cdsPONTBTPF.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmTipoFeriadoEdt := TfrmTipoFeriadoEdt.Create(Application);
  try
    frmTipoFeriadoEdt.Operacao := OpExcluir;
    frmTipoFeriadoEdt.pPON_PK_SEQ_TPF := dmDados.cdsPONTBTPF.FieldByName('PON_PK_SEQ_TPF').AsInteger;
    frmTipoFeriadoEdt.ShowModal;
  finally
    frmTipoFeriadoEdt.Free;
  end;
end;

procedure TfrmTipoFeriado.btnIncluirClick(Sender: TObject);
begin
  frmTipoFeriadoEdt := TfrmTipoFeriadoEdt.Create(Application);
  try
    frmTipoFeriadoEdt.Operacao := OpIncluir;
    frmTipoFeriadoEdt.ShowModal;
  finally
    frmTipoFeriadoEdt.Free;
  end;
end;

procedure TfrmTipoFeriado.CarregarDadosPONTBTPF;
begin
    dmDados.cdsPONTBTPF.Close;
    dmDados.cdsPONTBTPF.CommandText := 'SELECT * FROM PONTBTPF';
    dmDados.cdsPONTBTPF.IndexFieldNames := 'PON_DESC_TPF';
    dmDados.cdsPONTBTPF.Open;
end;

procedure TfrmTipoFeriado.edPesquisarClick(Sender: TObject);
begin
  edPesquisar.Text := '';
end;

procedure TfrmTipoFeriado.edPesquisarExit(Sender: TObject);
begin
  if edPesquisar.Text = '' then
  begin
    frmTipoFeriado.Pesquisar;
    edPesquisar.Text := 'Pesquisar...';
  end;
end;

procedure TfrmTipoFeriado.edPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     frmTipoFeriado.Pesquisar;
  end;
end;

procedure TfrmTipoFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmTipoFeriado.FormShow(Sender: TObject);
begin
  CarregarDadosPONTBTPF;
end;

procedure TfrmTipoFeriado.AtualizaGrid;
begin
  dmDados.cdsPONTBTPF.EmptyDataSet;
  frmTipoFeriado.CarregarDadosPONTBTPF;
  frmTipoFeriado.dbgrdTipoFeriado.Refresh;
end;

procedure TfrmTipoFeriado.Pesquisar;
begin
    dmDados.cdsPONTBTPF.EmptyDataSet;
    dmDados.cdsPONTBTPF.Close;
    dmDados.cdsPONTBTPF.CommandText := 'SELECT * FROM PONTBTPF ' +
                                          ' WHERE UPPER(PON_DESC_TPF) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')';
    dmDados.cdsPONTBTPF.IndexFieldNames := 'PON_DESC_TPF';
    dmDados.cdsPONTBTPF.Open;
    frmTipoFeriado.dbgrdTipoFeriado.Refresh;
end;

end.
