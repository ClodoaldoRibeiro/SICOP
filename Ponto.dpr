program Ponto;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  uSobre in 'uSobre.pas' {frmSobre},
  uFuncoes in 'uFuncoes.pas',
  uCofig in 'uCofig.pas' {frmConfig},
  uConstates in 'uConstates.pas',
  uDmDados in 'uDmDados.pas' {dmDados: TDataModule},
  uFeriado in 'uFeriado.pas' {frmFeriado},
  uFeriadoEdt in 'uFeriadoEdt.pas' {frmFeriadoEdt},
  uMsgUsuarioSemOutorizacao in 'uMsgUsuarioSemOutorizacao.pas' {frnUsuarioSemAutorizacao},
  uPerfilUsuario in 'uPerfilUsuario.pas' {frmPerfilUsuario},
  uPerfilUsuarioEdt in 'uPerfilUsuarioEdt.pas' {frmPerfilUsuarioEdt},
  uHorarioBatida in 'uHorarioBatida.pas' {frmHorarioPonto},
  uHorarioPontoEdit in 'uHorarioPontoEdit.pas' {frmHorarioPontoEdit},
  uFuncionario in 'uFuncionario.pas' {frmFuncionario},
  uFuncionarioEdt in 'uFuncionarioEdt.pas' {frmFuncionarioEdt},
  uTipoFeriado in 'uTipoFeriado.pas' {frmTipoFeriado},
  uTipoFeriadoEdt in 'uTipoFeriadoEdt.pas' {frmTipoFeriadoEdt};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de ponto';
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTipoFeriadoEdt, frmTipoFeriadoEdt);
  Application.Run;
end.
