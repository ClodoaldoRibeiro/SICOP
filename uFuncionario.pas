unit uFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Data.DB, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrmFuncionario = class(TForm)
    ilPadrão: TImageList;
    tlb1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    dbgrdFuncionario: TDBGrid;
    edPesquisar: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure AtualizaGrid;
    procedure CarregarDadosPONTBFUN();
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
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

uses uDmDados, uTipoFeriadoEdt, uConstates, uFuncionarioEdt;

procedure TfrmFuncionario.btnAlterarClick(Sender: TObject);
begin
  if dmDados.cdsPONTBFUN.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmFuncionarioEdt := TfrmFuncionarioEdt.Create(Application);
  try
    frmFuncionarioEdt.Operacao := OpAlterar;
    frmFuncionarioEdt.pPON_PK_SEQ_FUN := dmDados.cdsPONTBFUN.FieldByName('PON_PK_SEQ_FUN').AsInteger;
    frmFuncionarioEdt.ShowModal;
  finally
    frmFuncionarioEdt.Free;
  end;
end;

procedure TfrmFuncionario.btnExcluirClick(Sender: TObject);
begin
//  if dmDados.cdsPONTBTPF.IsEmpty then
//    begin
//      ShowMessage('Selecione um registro.');
//      Exit;
//    end;
//
//  frmTipoFeriadoEdt := TfrmTipoFeriadoEdt.Create(Application);
//  try
//    frmTipoFeriadoEdt.Operacao := OpExcluir;
//    frmTipoFeriadoEdt.pPON_PK_SEQ_TPF := dmDados.cdsPONTBTPF.FieldByName('PON_PK_SEQ_TPF').AsInteger;
//    frmTipoFeriadoEdt.ShowModal;
//  finally
//    frmTipoFeriadoEdt.Free;
//  end;
end;

procedure TfrmFuncionario.btnIncluirClick(Sender: TObject);
begin
  frmFuncionarioEdt := TfrmFuncionarioEdt.Create(Application);
  try
    frmFuncionarioEdt.Operacao := OpIncluir;
    frmFuncionarioEdt.ShowModal;
  finally
    frmFuncionarioEdt.Free;
  end;
end;

procedure TfrmFuncionario.CarregarDadosPONTBFUN;
begin
    dmDados.cdsPONTBFUN.Close;
    dmDados.cdsPONTBFUN.CommandText := 'SELECT * FROM PONTBFUN';
    dmDados.cdsPONTBFUN.IndexFieldNames := 'PON_PK_SEQ_FUN';
    dmDados.cdsPONTBFUN.Open;
end;

procedure TfrmFuncionario.edPesquisarClick(Sender: TObject);
begin
  edPesquisar.Text := '';
end;

procedure TfrmFuncionario.edPesquisarExit(Sender: TObject);
begin
  if edPesquisar.Text = '' then
  begin
    frmFuncionario.Pesquisar;
    edPesquisar.Text := 'Pesquisar...';
  end;
end;

procedure TfrmFuncionario.edPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     frmFuncionario.Pesquisar;
  end;
end;

procedure TfrmFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmFuncionario.FormShow(Sender: TObject);
begin
  CarregarDadosPONTBFUN;
end;

procedure TfrmFuncionario.AtualizaGrid;
begin
  dmDados.cdsPONTBFUN.EmptyDataSet;
  frmFuncionario.CarregarDadosPONTBFUN;
  frmFuncionario.dbgrdFuncionario.Refresh;
end;

procedure TfrmFuncionario.Pesquisar;
begin
    dmDados.cdsPONTBFUN.EmptyDataSet;
    dmDados.cdsPONTBFUN.Close;
    dmDados.cdsPONTBFUN.CommandText := 'SELECT * FROM PONTBFUN ' +
                                          ' WHERE UPPER(PON_NOME_FUN) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'') OR' +
                                                ' UPPER(PON_CPF_FUN) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')';
    dmDados.cdsPONTBFUN.IndexFieldNames := 'PON_PK_SEQ_FUN';
    dmDados.cdsPONTBFUN.Open;
    frmFuncionario.dbgrdFuncionario.Refresh;
end;
end.
