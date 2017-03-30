unit uTipoFeriadoEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type

  TOperacao = (OpIncluir, OpAlterar, OpExcluir);

  TfrmTipoFeriadoEdt = class(TForm)
    pnlRodape: TPanel;
    pnlControle: TPanel;
    btnFechar: TBitBtn;
    btnOK: TBitBtn;
    lblDescrição: TLabel;
    edtDescricao: TEdit;
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
    Operacao : TOperacao;
    pPON_PK_SEQ_TPF: Integer;

  end;

var
  frmTipoFeriadoEdt: TfrmTipoFeriadoEdt;

implementation

{$R *.dfm}

uses uDmDados, uConstates, uTipoFeriado;

{ TfrmTipoFeriadoEdt }

function TfrmTipoFeriadoEdt.alterar: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBTPF.IsEmpty then
  begin
    try
      dmDados.cdsPONTBTPF.Edit;
      dmDados.cdsPONTBTPF.FieldByName('PON_DESC_TPF').AsString := edtDescricao.Text;
      dmDados.cdsPONTBTPF.Post;
      dmDados.cdsPONTBTPF.ApplyUpdates(0);
      frmTipoFeriado.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao alterar tipo de feriado: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmTipoFeriadoEdt.btnOKClick(Sender: TObject);
begin
  if testarDados then
  begin
    if Operacao = OpIncluir then
    begin
      if incluir then
      begin
        ShowMessage('Registro incluido com sucesso!');
        edtDescricao.Text:= '';
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
      if MessageDlg('Tem certeza que deseja excluir esse registro?', mtConfirmation ,[mbYes, mbNo],0 ) =  mrYes then
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

procedure TfrmTipoFeriadoEdt.carregarRegistro;
begin
  dmDados.cdsPONTBTPF.Close;
  dmDados.cdsPONTBTPF.CommandText := ' SELECT * FROM PONTBTPF WHERE PON_PK_SEQ_TPF = ' +
                                                     QuotedStr(VarToStr(pPON_PK_SEQ_TPF));
  dmDados.cdsPONTBTPF.Open;
end;

function TfrmTipoFeriadoEdt.excluir: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBTPF.IsEmpty then
  begin
    try
      dmDados.cdsPONTBTPF.Delete;
      dmDados.cdsPONTBTPF.ApplyUpdates(0);
      frmTipoFeriado.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao ecluir tipo de feriado: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmTipoFeriadoEdt.FormShow(Sender: TObject);
begin
  if Operacao = OpIncluir then
  begin
    Caption := 'Inclusão de tipo de feriado';
    edtDescricao.SetFocus;
  end
  else if Operacao = OpAlterar then
  begin
    Caption := 'Alteração de tipo de feriado';
    carregarRegistro;
    MoverDadosFormularios;
    frmTipoFeriado.AtualizaGrid;
  end
  else
  begin
    Caption := 'Exclusão de tipo de feriado';
    carregarRegistro;
    MoverDadosFormularios;
    frmTipoFeriado.AtualizaGrid;
    pnlControle.Enabled := False;
    btnOK.SetFocus;
  end;
end;

function TfrmTipoFeriadoEdt.incluir: Boolean;
begin
  try
    dmDados.cdsPONTBTPF.Insert;
    dmDados.cdsPONTBTPF.FieldByName('PON_PK_SEQ_TPF').AsInteger := 0;
    dmDados.cdsPONTBTPF.FieldByName('PON_DESC_TPF').AsString := edtDescricao.Text;
    dmDados.cdsPONTBTPF.Post;
    dmDados.cdsPONTBTPF.ApplyUpdates(0);

    frmTipoFeriado.AtualizaGrid;
  except
    on e: Exception do
    begin
      ShowMessage('Erro ao inserir tipo de feriado: ' + e.Message);
    end;
  end;
  Result := True;
end;

procedure TfrmTipoFeriadoEdt.MoverDadosFormularios;
begin
  edtDescricao.Text := dmDados.cdsPONTBTPF.FieldByName('PON_DESC_TPF').AsString;
end;

function TfrmTipoFeriadoEdt.testarDados: Boolean;
begin
  Result := False;

  if (Operacao = OpIncluir) or (Operacao = OpAlterar) then
  begin
    if edtDescricao.Text = '' then
    begin
      ShowMessage('Informe a descrição do Tipo de Feriado.');
      if edtDescricao.CanFocus then
        edtDescricao.SetFocus;
      Exit;
    end
  end;
  Result := True;
end;
end.
