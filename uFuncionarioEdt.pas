unit uFuncionarioEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, ENumEd, EChkCPF, Vcl.Mask, EDBDate, EDateEd, Vcl.Grids,
  Vcl.Samples.Calendar, Vcl.DBCtrls;

type

  TOperacao = (OpIncluir, OpAlterar, OpExcluir);

  TfrmFuncionarioEdt = class(TForm)
    pnlRodape: TPanel;
    pnlControle: TPanel;
    btnFechar: TBitBtn;
    btnOK: TBitBtn;
    gpDadospessoai: TGroupBox;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    edtPON_NOME_FUN: TEdit;
    mePON_CPF_FUN: TMaskEdit;
    pgcCorpo: TPageControl;
    tsDadosPessoais: TTabSheet;
    tsEndereco: TTabSheet;
    gpEndereco: TGroupBox;
    lb8: TLabel;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    edPON_CIDADE_FUN: TEdit;
    mePON_CEP_FUN: TMaskEdit;
    cbbPON_ESTADO_FUN: TComboBox;
    edPON_BAIRRO_FUN: TEdit;
    edPON_ENDERECO_FUN: TEdit;
    tsContato: TTabSheet;
    gpContato: TGroupBox;
    lb5: TLabel;
    lb7: TLabel;
    lb13: TLabel;
    edPON_EMAIL_FUN: TEdit;
    mePON_CELULAR_FUN: TMaskEdit;
    mePON_TEL_FUN: TMaskEdit;
    tsHorarioPonto: TTabSheet;
    gp1: TGroupBox;
    lb1: TLabel;
    lb14: TLabel;
    lstHorarioInicial: TListBox;
    lstHorarioFinal: TListBox;
    edtPON_DATANASC_FUN: TEvDateEdit;
    dblst1: TDBListBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mePON_CPF_FUNExit(Sender: TObject);
  private
    { Private declarations }
    procedure carregarRegistro;
    procedure carregarPONTBBAT;
    procedure moverDadosFormulario;
    procedure limparCampos;

    function testarDados: Boolean;
    function incluir: Boolean;
    function alterar: Boolean;
    function excluir: Boolean;

  public
    { Public declarations }
    Operacao: TOperacao;
    pPON_PK_SEQ_FUN: Integer;

  end;

var
  frmFuncionarioEdt: TfrmFuncionarioEdt;

implementation

{$R *.dfm}

uses uDmDados, uConstates, uTipoFeriado, uFuncionario, uFuncoes;

{ TfrmTipoFeriadoEdt }

function TfrmFuncionarioEdt.alterar: Boolean;
begin
    carregarRegistro;
    if not dmDados.cdsPONTBTPF.IsEmpty then
    begin
        try
          dmDados.cdsPONTBTPF.Edit;
          dmDados.cdsPONTBTPF.FieldByName('PON_DESC_TPF').AsString :=
            edtPON_NOME_FUN.Text;
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

procedure TfrmFuncionarioEdt.btnOKClick(Sender: TObject);
begin
    if testarDados then
    begin
        if Operacao = OpIncluir then
        begin
            if incluir then
            begin
              ShowMessage('Registro incluido com sucesso!');
              limparCampos;
              pgcCorpo.ActivePageIndex := 0;
              if edtPON_NOME_FUN.CanFocus then
                edtPON_NOME_FUN.SetFocus;
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

procedure TfrmFuncionarioEdt.carregarRegistro;
begin
  dmDados.cdsPONTBFUN.Close;
  dmDados.cdsPONTBFUN.CommandText := ' SELECT * FROM PONTBFUN WHERE PON_PK_SEQ_FUN = ' +
                                                  QuotedStr(VarToStr(pPON_PK_SEQ_FUN));
  dmDados.cdsPONTBFUN.Open;
end;

function TfrmFuncionarioEdt.excluir: Boolean;
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

procedure TfrmFuncionarioEdt.FormShow(Sender: TObject);
begin
    if Operacao = OpIncluir then
    begin
      Caption := 'Inclusão funcionário';
      pgcCorpo.ActivePageIndex := 0;
      edtPON_NOME_FUN.SetFocus;
      edtPON_DATANASC_FUN.DateText := DateToStr(Now);
      CarregarPONTBBAT;
    end
    else if Operacao = OpAlterar then
    begin
      Caption := 'Alteração de funcionário';
      carregarRegistro;
      moverDadosFormulario;
      frmFuncionario.AtualizaGrid;
    end
    else
    begin
      Caption := 'Exclusão de tipo de feriado';
      carregarRegistro;
      CarregarPONTBBAT;
//      MoverDadosFormularios;
      frmTipoFeriado.AtualizaGrid;
      pnlControle.Enabled := False;
      btnOK.SetFocus;
    end;
end;

function TfrmFuncionarioEdt.incluir: Boolean;
begin
    try
      dmDados.carregarPONTBFUN;
      dmDados.cdsPONTBFUN.Insert;

      //  Mover dados pessoais
      dmDados.cdsPONTBFUN.FieldByName('PON_PK_SEQ_FUN').AsInteger := 0;
      dmDados.cdsPONTBFUN.FieldByName('PON_NOME_FUN').AsString := edtPON_NOME_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_CPF_FUN').AsString := mePON_CPF_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_DATANASC_FUN').AsDateTime := StrToDateTime(edtPON_DATANASC_FUN.DateText);

      //  Mover dados do Endereço
      dmDados.cdsPONTBFUN.FieldByName('PON_CEP_FUN').AsString := mePON_CEP_FUN.Text;
      if cbbPON_ESTADO_FUN.ItemIndex > -1 then
        dmDados.cdsPONTBFUN.FieldByName('PON_ESTADO_FUN').AsString := cbbPON_ESTADO_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_CIDADE_FUN').AsString := edPON_CIDADE_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_BAIRRO_FUN').AsString := edPON_BAIRRO_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_ENDERECO_FUN').AsString := edPON_ENDERECO_FUN.Text;

      //  Mover dados contato
      dmDados.cdsPONTBFUN.FieldByName('PON_CELULAR_FUN').AsString := mePON_CELULAR_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_TEL_FUN').AsString := mePON_TEL_FUN.Text;
      dmDados.cdsPONTBFUN.FieldByName('PON_EMAIL_FUN').AsString := edPON_EMAIL_FUN.Text;

      //  Mover dados da batida de ponto
      dmDados.cdsPONTBFUN.FieldByName('PON_BATMANHA_FUN').AsInteger :=  lstHorarioInicial.ItemIndex;
      dmDados.cdsPONTBFUN.FieldByName('PON_BATTARDE_FUN').AsInteger := lstHorarioFinal.ItemIndex;

      dmDados.cdsPONTBFUN.Post;
      dmDados.cdsPONTBFUN.ApplyUpdates(0);

      frmFuncionario.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao inserir funcionário: ' + e.Message);
      end;
    end;
    Result := True;
end;

procedure TfrmFuncionarioEdt.mePON_CPF_FUNExit(Sender: TObject);
begin
  if Trim(mePON_CPF_FUN.Text) <> '' then
  begin
    if not uFuncoes.testacpf(mePON_CPF_FUN.Text) then
        ShowMessage('CPF Invalido!');
  end;
end;

procedure TfrmFuncionarioEdt.CarregarPONTBBAT;
var
  horarios : string;
  numero: Integer;

begin
    horarios := '';
    numero := 0;

    dmDados.carregarPONTBBAT;
    while not dmDados.cdsPONTBBAT.Eof do
    begin
      horarios := dmDados.cdsPONTBBAT.FieldByName('PON_HORAINICIAL_BAT').AsString + ' ás ' +
                  dmDados.cdsPONTBBAT.FieldByName('PON_HORAFINAL_BAT').AsString;
      lstHorarioInicial.Items[numero] := horarios;
      lstHorarioFinal.Items[numero] := horarios;
      dmDados.cdsPONTBBAT.Next;
      uFuncoes.Inc(numero);
    end;
end;

procedure TfrmFuncionarioEdt.moverDadosFormulario;
begin
  try
      //  Mover dados pessoais
      edtPON_NOME_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_NOME_FUN').AsString;
      mePON_CPF_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_CPF_FUN').AsString;
      edtPON_DATANASC_FUN.DateText := dmDados.cdsPONTBFUN.FieldByName('PON_DATANASC_FUN').AsString;

      //  Mover dados do Endereço
      mePON_CEP_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_CEP_FUN').AsString;
      cbbPON_ESTADO_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_ESTADO_FUN').AsString;
      edPON_CIDADE_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_CIDADE_FUN').AsString;
      edPON_BAIRRO_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_BAIRRO_FUN').AsString;
      edPON_ENDERECO_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_ENDERECO_FUN').AsString;

      //  Mover dados contato
      mePON_CELULAR_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_CELULAR_FUN').AsString;
      mePON_TEL_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_TEL_FUN').AsString;
      edPON_EMAIL_FUN.Text := dmDados.cdsPONTBFUN.FieldByName('PON_EMAIL_FUN').AsString;

//      //  Mover dados da batida de ponto
//      dmDados.cdsPONTBFUN.FieldByName('PON_BATMANHA_FUN').AsInteger :=  3;
//      dmDados.cdsPONTBFUN.FieldByName('PON_BATTARDE_FUN').AsInteger := 5;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao mover funcionário para formulário: ' + e.Message);
      end;
    end;
end;

procedure TfrmFuncionarioEdt.limparCampos;
begin
    //  Mover dados pessoais
    edtPON_NOME_FUN.Text := '';
    mePON_CPF_FUN.Text := '';
    edtPON_DATANASC_FUN.DateText := DateToStr(now);

    //  Mover dados do Endereço
    mePON_CEP_FUN.Text := '';
    cbbPON_ESTADO_FUN.Text := '';
    edPON_CIDADE_FUN.Text := '';
    edPON_BAIRRO_FUN.Text := '';
    edPON_ENDERECO_FUN.Text := '';

    //  Mover dados contato
    mePON_CELULAR_FUN.Text := '';
    mePON_TEL_FUN.Text := '';
    edPON_EMAIL_FUN.Text := '';

//    //  Mover dados da batida de ponto
//    dmDados.cdsPONTBFUN.FieldByName('PON_BATMANHA_FUN').AsInteger :=  3;
//    dmDados.cdsPONTBFUN.FieldByName('PON_BATTARDE_FUN').AsInteger := 5;
end;

function TfrmFuncionarioEdt.testarDados: Boolean;
begin
    Result := False;

    if (Operacao = OpIncluir) or (Operacao = OpAlterar) then
    begin
        if edtPON_NOME_FUN.Text = '' then
        begin
          ShowMessage('Informe o nome do funcionário.');
          if edtPON_NOME_FUN.CanFocus then
            edtPON_NOME_FUN.SetFocus;
          Exit;
        end;

        if (edtPON_DATANASC_FUN.DateText =  '') then
        begin
          ShowMessage('Data de nascimento deve ser infomada.');
          if edtPON_DATANASC_FUN.CanFocus then
            edtPON_DATANASC_FUN.SetFocus;
          Exit;
        end;

        if mePON_CPF_FUN.Text = '' then
        begin
          ShowMessage('CPF deve ser infomado');
          if mePON_CPF_FUN.CanFocus then
            mePON_CPF_FUN.SetFocus;
          Exit;
        end
    end;
    Result := True;
end;

end.
