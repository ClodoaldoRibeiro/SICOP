unit uPerfilUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Data.DB, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrmPerfilUsuario = class(TForm)
    ilPadrão: TImageList;
    tlb1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    dbgrdpPerfilUsuario: TDBGrid;
    edPesquisar: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

    procedure AtualizaGrid;
    procedure CarregarDadosPONTBPFL();
    procedure edPesquisarClick(Sender: TObject);
    procedure edPesquisarExit(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure Pesquisar;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPerfilUsuario: TfrmPerfilUsuario;

implementation

{$R *.dfm}

uses uDmDados, uTipoFeriadoEdt, uConstates, uPerfilUsuarioEdt;

procedure TfrmPerfilUsuario.btnAlterarClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';

  if dmDados.cdsPONTBPFL.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;
  frmPerfilUsuarioEdt := TfrmPerfilUsuarioEdt.Create(Application);
  try
    frmPerfilUsuarioEdt.Operacao := OpAlterar;
    frmPerfilUsuarioEdt.pPON_PK_SEQ_PFL := dmDados.cdsPONTBPFL.FieldByName('PON_PK_SEQ_PFL').AsInteger;
    frmPerfilUsuarioEdt.ShowModal;
  finally
    frmPerfilUsuarioEdt.Free;
  end;
end;

procedure TfrmPerfilUsuario.btnExcluirClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';

  if dmDados.cdsPONTBPFL.IsEmpty then
    begin
      ShowMessage('Selecione um registro.');
      Exit;
    end;

  frmPerfilUsuarioEdt := TfrmPerfilUsuarioEdt.Create(Application);
  try
    frmPerfilUsuarioEdt.Operacao := OpExcluir;
    frmPerfilUsuarioEdt.pPON_PK_SEQ_PFL := dmDados.cdsPONTBPFL.FieldByName('PON_PK_SEQ_PFL').AsInteger;
    frmPerfilUsuarioEdt.ShowModal;
  finally
    frmPerfilUsuarioEdt.Free;
  end;
end;

procedure TfrmPerfilUsuario.btnIncluirClick(Sender: TObject);
begin
  edPesquisar.Text := 'Pesquisar...';
  frmPerfilUsuarioEdt := TfrmPerfilUsuarioEdt.Create(Application);
  try
    frmPerfilUsuarioEdt.Operacao := OpIncluir;
    frmPerfilUsuarioEdt.ShowModal;
  finally
    frmPerfilUsuarioEdt.Free;
  end;
end;

procedure TfrmPerfilUsuario.CarregarDadosPONTBPFL;
begin
    dmDados.cdsPONTBPFL.Close;
    dmDados.cdsPONTBPFL.CommandText := 'SELECT * FROM PONTBPFL';
    dmDados.cdsPONTBPFL.IndexFieldNames := 'PON_DESC_PFL';
    dmDados.cdsPONTBPFL.Open;
end;

procedure TfrmPerfilUsuario.edPesquisarClick(Sender: TObject);
begin
  edPesquisar.Text := '';
end;

procedure TfrmPerfilUsuario.edPesquisarExit(Sender: TObject);
begin
  if edPesquisar.Text = '' then
  begin
    frmPerfilUsuario.Pesquisar;
    edPesquisar.Text := 'Pesquisar...';
  end;
end;

procedure TfrmPerfilUsuario.edPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     frmPerfilUsuario.Pesquisar;
  end;
end;

procedure TfrmPerfilUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmPerfilUsuario.FormShow(Sender: TObject);
begin
  CarregarDadosPONTBPFL;
end;

procedure TfrmPerfilUsuario.AtualizaGrid;
begin
  dmDados.cdsPONTBPFL.EmptyDataSet;
  frmPerfilUsuario.CarregarDadosPONTBPFL;
  frmPerfilUsuario.dbgrdpPerfilUsuario.Refresh;
end;

procedure TfrmPerfilUsuario.Pesquisar;
begin
    dmDados.cdsPONTBPFL.EmptyDataSet;
    dmDados.cdsPONTBPFL.Close;
    dmDados.cdsPONTBPFL.CommandText := 'SELECT * FROM PONTBPFL ' +
                                          ' WHERE UPPER(PON_DESC_PFL) LIKE ' + 'UPPER(''%'+edPesquisar.text+'%'')';
    dmDados.cdsPONTBPFL.IndexFieldNames := 'PON_DESC_PFL';
    dmDados.cdsPONTBPFL.Open;
    frmPerfilUsuario.dbgrdpPerfilUsuario.Refresh;
end;
end.
