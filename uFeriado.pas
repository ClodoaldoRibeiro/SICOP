unit uFeriado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Data.DB, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrmFeriado = class(TForm)
    ilPadrão: TImageList;
    tlb1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    dbgrdFeriado: TDBGrid;
    edPesquisar: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure AtualizaGrid;
    procedure CarregarDados;
    procedure Pesquisar;
    procedure edPesquisarClick(Sender: TObject);
    procedure edPesquisarExit(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmFeriado: TfrmFeriado;

implementation

{$R *.dfm}

uses uDmDados, uTipoFeriadoEdt, uConstates, uTipoFeriado, uFeriadoEdt,
  uPerfilUsuario;

procedure TfrmFeriado.btnAlterarClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';

  if dmDados.cdsPONTBFER.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmFeriadoEdt := TfrmFeriadoEdt.Create(Application);
  try
    frmFeriadoEdt.gOperacao := OpAlterar;
    frmFeriadoEdt.gPON_PK_SEQ_FER := dmDados.cdsPONTBFER.FieldByName('PON_PK_SEQ_FER').AsInteger;
    frmFeriadoEdt.ShowModal;
  finally
    frmFeriadoEdt.Free;
  end;
end;

procedure TfrmFeriado.btnExcluirClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';

  if dmDados.cdsPONTBFER.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmFeriadoEdt := TfrmFeriadoEdt.Create(Application);
  try
    frmFeriadoEdt.gOperacao := OpExcluir;
    frmFeriadoEdt.gPON_PK_SEQ_FER := dmDados.cdsPONTBFER.FieldByName('PON_PK_SEQ_FER').AsInteger;
    frmFeriadoEdt.ShowModal;
  finally
    frmFeriadoEdt.Free;
  end;
end;

procedure TfrmFeriado.btnIncluirClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';

  frmFeriadoEdt := TfrmFeriadoEdt.Create(Application);
  try
    frmFeriadoEdt.gOperacao := OpIncluir;
    frmFeriadoEdt.ShowModal;
  finally
    frmFeriadoEdt.Free;
  end;
end;

procedure TfrmFeriado.CarregarDados;
begin
    dmDados.cdsPONTBFER.Close;
    dmDados.cdsPONTBFER.CommandText := 'SELECT * FROM PONTBFER';
    dmDados.cdsPONTBFER.Open;
end;

procedure TfrmFeriado.edPesquisarClick(Sender: TObject);
begin
    edPesquisar.Text := '';
end;

procedure TfrmFeriado.edPesquisarExit(Sender: TObject);
begin
  if edPesquisar.Text = '' then
  begin
    frmFeriado.Pesquisar;
    edPesquisar.Text := 'Pesquisar...';
  end;

end;

procedure TfrmFeriado.edPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     frmFeriado.Pesquisar;
  end;
end;

procedure TfrmFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmFeriado.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

procedure TfrmFeriado.AtualizaGrid;
begin
  dmDados.cdsPONTBFER.EmptyDataSet;
  frmFeriado.CarregarDados;
  frmFeriado.dbgrdFeriado.Refresh;
end;


procedure TfrmFeriado.Pesquisar;
begin
    dmDados.cdsPONTBFER.EmptyDataSet;
    dmDados.cdsPONTBFER.Close;
    dmDados.cdsPONTBFER.CommandText := 'SELECT * FROM PONTBFER ' +
                                          ' WHERE UPPER(PON_DESC_FER) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')' +
                                          '   OR UPPER(PON_DATA_FER) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')';
    dmDados.cdsPONTBFER.IndexFieldNames := 'PON_PK_SEQ_FER';
    dmDados.cdsPONTBFER.Open;
    frmFeriado.dbgrdFeriado.Refresh;
end;

end.
