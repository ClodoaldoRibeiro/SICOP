unit uHorarioBatida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Data.DB, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrmHorarioPonto = class(TForm)
    ilPadrão: TImageList;
    tlb1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    dbgrdHorarioBatida: TDBGrid;
    edPesquisar: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure AtualizaGrid;
    procedure CarregarDadosPONTBBAT();
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
  frmHorarioPonto: TfrmHorarioPonto;

implementation

{$R *.dfm}

uses uDmDados, uTipoFeriadoEdt, uConstates, uTipoFeriado, uHorarioPontoEdit;

procedure TfrmHorarioPonto.btnAlterarClick(Sender: TObject);
begin
  if dmDados.cdsPONTBBAT.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmHorarioPontoEdit := TfrmHorarioPontoEdit.Create(Application);
  try
    frmHorarioPontoEdit.Operacao := OpAlterar;
    frmHorarioPontoEdit.pPON_PK_SEQ_BAT := dmDados.cdsPONTBBAT.FieldByName('PON_PK_SEQ_BAT').AsInteger;
    frmHorarioPontoEdit.ShowModal;
  finally
    frmTipoFeriadoEdt.Free;
  end;
end;

procedure TfrmHorarioPonto.btnExcluirClick(Sender: TObject);
begin
  if dmDados.cdsPONTBBAT.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmHorarioPontoEdit := TfrmHorarioPontoEdit.Create(Application);
  try
    frmHorarioPontoEdit.Operacao := OpExcluir;
    frmHorarioPontoEdit.pPON_PK_SEQ_BAT := dmDados.cdsPONTBBAT.FieldByName('PON_PK_SEQ_BAT').AsInteger;
    frmHorarioPontoEdit.ShowModal;
  finally
    frmHorarioPontoEdit.Free;
  end;
end;

procedure TfrmHorarioPonto.btnIncluirClick(Sender: TObject);
begin
  frmHorarioPontoEdit := TfrmHorarioPontoEdit.Create(Application);
  try
    frmHorarioPontoEdit.Operacao := OpIncluir;
    frmHorarioPontoEdit.ShowModal;
  finally
    frmHorarioPontoEdit.Free;
  end;
end;

procedure TfrmHorarioPonto.CarregarDadosPONTBBAT;
begin
    dmDados.cdsPONTBBAT.Close;
    dmDados.cdsPONTBBAT.CommandText := 'SELECT * FROM PONTBBAT';
    dmDados.cdsPONTBBAT.IndexFieldNames := 'PON_PK_SEQ_BAT';
    dmDados.cdsPONTBBAT.Open;
end;

procedure TfrmHorarioPonto.edPesquisarClick(Sender: TObject);
begin
  edPesquisar.Text := '';
end;

procedure TfrmHorarioPonto.edPesquisarExit(Sender: TObject);
begin
  if edPesquisar.Text = '' then
  begin
    frmHorarioPonto.Pesquisar;
    edPesquisar.Text := 'Pesquisar...';
  end;
end;

procedure TfrmHorarioPonto.edPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     frmHorarioPonto.Pesquisar;
  end;
end;

procedure TfrmHorarioPonto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmHorarioPonto.FormShow(Sender: TObject);
begin
  CarregarDadosPONTBBAT;
end;

procedure TfrmHorarioPonto.AtualizaGrid;
begin
  dmDados.cdsPONTBBAT.EmptyDataSet;
  frmHorarioPonto.CarregarDadosPONTBBAT;
  frmHorarioPonto.dbgrdHorarioBatida.Refresh;
end;

procedure TfrmHorarioPonto.Pesquisar;
begin
    dmDados.cdsPONTBBAT.EmptyDataSet;
    dmDados.cdsPONTBBAT.Close;
    dmDados.cdsPONTBBAT.CommandText := 'SELECT * FROM PONTBBAT ' +
                                          ' WHERE UPPER(PON_HORAINICIAL_BAT) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'') OR ' +
                                          '       UPPER(PON_HORAFINAL_BAT) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')';
    dmDados.cdsPONTBBAT.IndexFieldNames := 'PON_PK_SEQ_BAT';
    dmDados.cdsPONTBBAT.Open;
    frmHorarioPonto.dbgrdHorarioBatida.Refresh;
end;

end.
