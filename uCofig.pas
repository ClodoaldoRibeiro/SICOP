unit uCofig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.IniFiles;

type
  TfrmConfig = class(TForm)
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    lblgbd: TLabel;
    edtGdb: TEdit;
    dlgArquivo: TOpenDialog;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnProcurar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure salvarParametros;
    procedure lerParametros;
    function testarDados: Boolean;

  public
    { Public declarations }
    function getdriverName: string;
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses uFuncoes, uConstates;
{ TForm1 }

procedure TfrmConfig.btnAbrirClick(Sender: TObject);
begin
   if dlgArquivo.Execute then
    edtGdb.Text := dlgArquivo.FileName;
end;

procedure TfrmConfig.btnProcurarClick(Sender: TObject);
begin
  if dlgArquivo.Execute then
    edtGdb.Text := dlgArquivo.FileName;
end;

procedure TfrmConfig.btnSalvarClick(Sender: TObject);
begin
  if testarDados then
  begin
    salvarParametros;
    ModalResult := mrOk;
  end;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  lerParametros;
end;

function TfrmConfig.getdriverName: string;
begin
  Result := 'Interbase';
end;

procedure TfrmConfig.lerParametros;
begin
  edtUsuario.Text := uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccUSUARIO);
  edtSenha.Text := uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccSENHA);
  edtGdb.Text := uFuncoes.getIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccGDB);
end;

procedure TfrmConfig.salvarParametros;
begin
  uFuncoes.setIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccDRIVERNAME, getDriverName);
  uFuncoes.setIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccUSUARIO, edtUsuario.Text);
  uFuncoes.setIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccSENHA, edtSenha.Text);
  uFuncoes.setIni(uConstates.ccINIFILE, uConstates.ccBANCDADOS, uConstates.ccGDB, edtGdb.Text);
end;

function TfrmConfig.testarDados: Boolean;
begin
  Result := False;

  if Trim(edtUsuario.Text) = '' then
  begin
    ShowMessage('Informe o usuário!');
    if edtUsuario.CanFocus then
      edtUsuario.SetFocus;
    Exit;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Informe a senha!');
    if edtSenha.CanFocus then
      edtSenha.SetFocus;
    Exit;
  end;

  if Trim(edtGdb.Text) = '' then
  begin
    ShowMessage('Arquivo gdn/fdb precisa ser informado!');
    if edtGdb.CanFocus then
      edtGdb.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
