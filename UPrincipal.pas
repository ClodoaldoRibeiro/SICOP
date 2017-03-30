unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ImgList, Data.DB,
  Data.SqlExpr, Data.DBXFirebird, Data.DBXInterBase, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    mmMunuPrincipal: TMainMenu;
    mniArquivo: TMenuItem;
    mniNovo: TMenuItem;
    mniSair: TMenuItem;
    mniFuncionario: TMenuItem;
    mniFeriado: TMenuItem;
    mniHorarioPonto: TMenuItem;
    mniTipoFeriado: TMenuItem;
    mniUsuario: TMenuItem;
    mniJanela: TMenuItem;
    mniFerranentas: TMenuItem;
    mniAjuda: TMenuItem;
    mniSobre: TMenuItem;
    mniBancoDados: TMenuItem;
    mniCascata: TMenuItem;
    mniVertical: TMenuItem;
    mniHorizontal: TMenuItem;
    mniAjustePonto: TMenuItem;
    imgPrincipal: TImageList;
    statPrincipal: TStatusBar;
    mniPerfilUsuario: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure mniSobreClick(Sender: TObject);
    procedure mniBancoDadosClick(Sender: TObject);
    procedure mniTipoFeriadoClick(Sender: TObject);
    procedure mniFeriadoClick(Sender: TObject);
    procedure mniPerfilUsuarioClick(Sender: TObject);
    procedure mniHorarioPontoClick(Sender: TObject);
    procedure mniFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfStatPrincipal;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uSobre, uCofig, uDmDados, uTipoFeriado, uMsgUsuarioSemOutorizacao,
  uFeriado, uPerfilUsuario, uHorarioBatida, uFuncionario;

procedure TfrmPrincipal.ConfStatPrincipal;
begin
   if dmDados.conconexao.Connected then
      frmPrincipal.statPrincipal.Panels.Items[1].Text := dmDados.conconexao.Params.ValueS['user_name']
   else
      frmPrincipal.statPrincipal.Panels.Items[1].Text := '';
   frmPrincipal.statPrincipal.Panels.Items[3].Text := FormatDateTime('dd/mm/yyyy   hh:nn', Now);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.Caption := Application.Title;
  dmDados.setTFDConnection(dmDados.conconexao);
  frmPrincipal.ConfStatPrincipal;
end;

procedure TfrmPrincipal.mniBancoDadosClick(Sender: TObject);
begin
  frmConfig := TfrmConfig.Create(Application);
  try
    frmConfig.ShowModal;
  finally
    frmConfig.Free;
  end;
end;

procedure TfrmPrincipal.mniFeriadoClick(Sender: TObject);
begin
  if dmDados.getAutorizacao('PONTBTPF') then
  begin
    frmFeriado := TfrmFeriado.Create(Application);
  end
  else
  begin
      frnUsuarioSemAutorizacao := TfrnUsuarioSemAutorizacao.Create(Application);
      frnUsuarioSemAutorizacao.ShowModal;
      frnUsuarioSemAutorizacao.Free;
  end;
end;

procedure TfrmPrincipal.mniFuncionarioClick(Sender: TObject);
begin
  if dmDados.getAutorizacao('PONTBFUN') then
  begin
    frmFuncionario := TfrmFuncionario.Create(Application);
  end
  else
  begin
      frnUsuarioSemAutorizacao := TfrnUsuarioSemAutorizacao.Create(Application);
      frnUsuarioSemAutorizacao.ShowModal;
      frnUsuarioSemAutorizacao.Free;
  end;
end;

procedure TfrmPrincipal.mniHorarioPontoClick(Sender: TObject);
begin
   if dmDados.getAutorizacao('PONTBBAT') then
  begin
    frmHorarioPonto := TfrmHorarioPonto.Create(Application);
  end
  else
  begin
      frnUsuarioSemAutorizacao := TfrnUsuarioSemAutorizacao.Create(Application);
      frnUsuarioSemAutorizacao.ShowModal;
      frnUsuarioSemAutorizacao.Free;
  end;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mniSobreClick(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Application);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Free;
  end;
end;

procedure TfrmPrincipal.mniTipoFeriadoClick(Sender: TObject);
begin
  if dmDados.getAutorizacao('PONTBTPF') then
  begin
    frmTipoFeriado := TfrmTipoFeriado.Create(Application);
  end
  else
  begin
      frnUsuarioSemAutorizacao := TfrnUsuarioSemAutorizacao.Create(Application);
      frnUsuarioSemAutorizacao.ShowModal;
      frnUsuarioSemAutorizacao.Free;
  end;
end;

procedure TfrmPrincipal.mniPerfilUsuarioClick(Sender: TObject);
begin
  if dmDados.getAutorizacao('PONTBPFL') then
  begin
    frmPerfilUsuario := TfrmPerfilUsuario.Create(Application);
  end
  else
  begin
      frnUsuarioSemAutorizacao := TfrnUsuarioSemAutorizacao.Create(Application);
      frnUsuarioSemAutorizacao.ShowModal;
      frnUsuarioSemAutorizacao.Free;
  end;
end;

end.
