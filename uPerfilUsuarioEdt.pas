unit uPerfilUsuarioEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type

  TOperacao = (OpIncluir, OpAlterar, OpExcluir);

  TfrmPerfilUsuarioEdt = class(TForm)
    pnlRodape: TPanel;
    pnlControle: TPanel;
    btnFechar: TBitBtn;
    btnOK: TBitBtn;
    lblDescrição: TLabel;
    edtDescricao: TEdit;
    rgPON_ADM_PFL: TRadioGroup;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregarRegistro;
    procedure MoverDadosFormularios;

    function testarDados: Boolean;
    function incluir: Boolean;
    function alterar: Boolean;
    function excluir: Boolean;

  public
    { Public declarations }
    Operacao: TOperacao;
    pPON_PK_SEQ_PFL: Integer;

  end;

var
  frmPerfilUsuarioEdt: TfrmPerfilUsuarioEdt;

implementation

{$R *.dfm}

uses uDmDados, uConstates, uTipoFeriado, uPerfilUsuario;

{ TfrmTipoFeriadoEdt }

function TfrmPerfilUsuarioEdt.alterar: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBPFL.IsEmpty then
  begin
    try
      dmDados.cdsPONTBPFL.Edit;
      dmDados.cdsPONTBPFL.FieldByName('PON_DESC_PFL').AsString := edtDescricao.Text;
      dmDados.cdsPONTBPFL.FieldByName('PON_ADM_PFL').AsBoolean := (rgPON_ADM_PFL.ItemIndex = 1);
      dmDados.cdsPONTBPFL.Post;
      dmDados.cdsPONTBPFL.ApplyUpdates(0);
      frmPerfilUsuario.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao o perfil de usuário: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmPerfilUsuarioEdt.btnOKClick(Sender: TObject);
begin
  if testarDados then
  begin
    if Operacao = OpIncluir then
    begin
      if incluir then
      begin
        ShowMessage('Registro incluso com sucesso!');
        edtDescricao.Text := '';
        rgPON_ADM_PFL.ItemIndex := -1;
        if edtDescricao.CanFocus then
          edtDescricao.SetFocus;
      end;
    end
    else if Operacao = OpAlterar then
    begin
      if alterar then
      begin
        ShowMessage('Registro alterado com sucesso!');
        ModalResult := mrOk;
      end;
    end
    else
    begin
      if MessageDlg('Tem certeza que deseja excluir esse registro?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if excluir then
        begin
          ShowMessage('Registro excluído com sucesso!');
          ModalResult := mrOk;
        end;
      end;
    end;
  end;
end;

procedure TfrmPerfilUsuarioEdt.carregarRegistro;
begin
  dmDados.cdsPONTBPFL.Close;
  dmDados.cdsPONTBPFL.CommandText := ' SELECT * FROM PONTBPFL WHERE PON_PK_SEQ_PFL = ' +
                                        QuotedStr(VarToStr(pPON_PK_SEQ_PFL));
  dmDados.cdsPONTBPFL.Open;
end;

function TfrmPerfilUsuarioEdt.excluir: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBPFL.IsEmpty then
  begin
    try
      dmDados.cdsPONTBPFL.Delete;
      dmDados.cdsPONTBPFL.ApplyUpdates(0);
      frmPerfilUsuario.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao ecluir perfil de usuário: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmPerfilUsuarioEdt.FormShow(Sender: TObject);
begin
  if Operacao = OpIncluir then
  begin
    Caption := 'Inclusão de perfil de usuário';
    edtDescricao.SetFocus;
  end
  else if Operacao = OpAlterar then
  begin
    Caption := 'Alteração de perfil de usuário';
    carregarRegistro;
    MoverDadosFormularios;
    frmPerfilUsuario.AtualizaGrid;
  end
  else
  begin
    Caption := 'Exclusão de perfil de usuário';
    carregarRegistro;
    MoverDadosFormularios;
    frmPerfilUsuario.AtualizaGrid;
    pnlControle.Enabled := False;
    btnOK.SetFocus;
  end;
end;

function TfrmPerfilUsuarioEdt.incluir: Boolean;
begin
  try
    dmDados.cdsPONTBPFL.Insert;
    dmDados.cdsPONTBPFL.FieldByName('PON_PK_SEQ_PFL').AsInteger := 0;
    dmDados.cdsPONTBPFL.FieldByName('PON_DESC_PFL').AsString := edtDescricao.Text;
    dmDados.cdsPONTBPFL.FieldByName('PON_ADM_PFL').AsBoolean := (rgPON_ADM_PFL.ItemIndex = 1);
    dmDados.cdsPONTBPFL.Post;
    dmDados.cdsPONTBPFL.ApplyUpdates(0);

    frmPerfilUsuario.AtualizaGrid;
  except
    on e: Exception do
    begin
      ShowMessage('Erro ao inserir perfil de usuário: ' + e.Message);
    end;
  end;
  Result := True;
end;

procedure TfrmPerfilUsuarioEdt.MoverDadosFormularios;
begin
  edtDescricao.Text := dmDados.cdsPONTBPFL.FieldByName('PON_DESC_PFL').AsString;

  if dmDados.cdsPONTBPFL.FieldByName('PON_ADM_PFL').AsBoolean then
  begin
    rgPON_ADM_PFL.ItemIndex := 1;
  end
  else
  begin
     rgPON_ADM_PFL.ItemIndex := 0;
  end;

end;

function TfrmPerfilUsuarioEdt.testarDados: Boolean;
begin
  Result := False;

  if (Operacao = OpIncluir) or (Operacao = OpAlterar) then
  begin
    if edtDescricao.Text = '' then
    begin
      ShowMessage('Informe a descrição do perfil do usuário.');
      if edtDescricao.CanFocus then
        edtDescricao.SetFocus;
      Exit;
    end;

    if rgPON_ADM_PFL.ItemIndex = -1 then
    begin
      ShowMessage('Informe se o perfil do usuário e administrador ou não.');
      if rgPON_ADM_PFL.CanFocus then
        rgPON_ADM_PFL.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

end.
