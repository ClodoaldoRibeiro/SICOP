unit uHorarioPontoEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, EDateEd, ETimeEd;

type

  TOperacao = (OpIncluir, OpAlterar, OpExcluir);

  TfrmHorarioPontoEdit = class(TForm)
    pnlRodape: TPanel;
    pnlControle: TPanel;
    btnFechar: TBitBtn;
    btnOK: TBitBtn;
    lblDescrição: TLabel;
    lb1: TLabel;
    edtHoraEntrada: TEvTimeEdit;
    edtHoraSaida: TEvTimeEdit;
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
    pPON_PK_SEQ_BAT: Integer;

  end;

var
  frmHorarioPontoEdit: TfrmHorarioPontoEdit;

implementation

{$R *.dfm}

uses uDmDados, uConstates, uTipoFeriado, uHorarioBatida;

{ TfrmTipoFeriadoEdt }

function TfrmHorarioPontoEdit.alterar: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBBAT.IsEmpty then
  begin
    try
      dmDados.cdsPONTBBAT.Edit;
      dmDados.cdsPONTBBAT.FieldByName('PON_HORAINICIAL_BAT').AsDateTime:= StrToDateTime(edtHoraEntrada.TimeText);
      dmDados.cdsPONTBBAT.FieldByName('PON_HORAFINAL_BAT').AsDateTime := StrToDateTime(edtHoraSaida.TimeText);
      dmDados.cdsPONTBBAT.Post;
      dmDados.cdsPONTBBAT.ApplyUpdates(0);
      frmHorarioPonto.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao alterar horário de ponto: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmHorarioPontoEdit.btnOKClick(Sender: TObject);
begin
  if testarDados then
  begin
    if Operacao = OpIncluir then
    begin
      if incluir then
      begin
        ShowMessage('Registro incluido com sucesso!');
        edtHoraEntrada.Text:= '00:00:00';
        edtHoraSaida.Text:= '00:00:00';
        if edtHoraEntrada.CanFocus then
          edtHoraEntrada.SetFocus;
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

procedure TfrmHorarioPontoEdit.carregarRegistro;
begin
  dmDados.cdsPONTBBAT.Close;
  dmDados.cdsPONTBBAT.CommandText := ' SELECT * FROM PONTBBAT WHERE PON_PK_SEQ_BAT = ' +
                                                     QuotedStr(VarToStr(pPON_PK_SEQ_BAT));
  dmDados.cdsPONTBBAT.Open;
end;

function TfrmHorarioPontoEdit.excluir: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBBAT.IsEmpty then
  begin
    try
      dmDados.cdsPONTBBAT.Delete;
      dmDados.cdsPONTBBAT.ApplyUpdates(0);
      frmHorarioPonto.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao excluir horário de ponto: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmHorarioPontoEdit.FormShow(Sender: TObject);
begin
  if Operacao = OpIncluir then
  begin
    Caption := 'Inclusão de horário de ponto';
    edtHoraEntrada.SetFocus;
  end
  else if Operacao = OpAlterar then
  begin
    Caption := 'Alteração de horário de ponto';
    carregarRegistro;
    MoverDadosFormularios;
    frmHorarioPonto.AtualizaGrid;
  end
  else
  begin
    Caption := 'Exclusão de horário de ponto';
    carregarRegistro;
    MoverDadosFormularios;
    frmHorarioPonto.AtualizaGrid;
    pnlControle.Enabled := False;
    btnOK.SetFocus;
  end;
end;

function TfrmHorarioPontoEdit.incluir: Boolean;
begin
  try
    dmDados.cdsPONTBBAT.Insert;
    dmDados.cdsPONTBBAT.FieldByName('PON_PK_SEQ_BAT').AsInteger := 0;
    dmDados.cdsPONTBBAT.FieldByName('PON_HORAINICIAL_BAT').AsDateTime:= StrToDateTime(edtHoraEntrada.TimeText);
    dmDados.cdsPONTBBAT.FieldByName('PON_HORAFINAL_BAT').AsDateTime := StrToDateTime(edtHoraSaida.TimeText);
    dmDados.cdsPONTBBAT.Post;
    dmDados.cdsPONTBBAT.ApplyUpdates(0);

    frmHorarioPonto.AtualizaGrid;
  except
    on e: Exception do
    begin
      ShowMessage('Erro ao inserir horário de ponto: ' + e.Message);
    end;
  end;
  Result := True;
end;

procedure TfrmHorarioPontoEdit.MoverDadosFormularios;
begin
  edtHoraEntrada.TimeText := dmDados.cdsPONTBBAT.FieldByName('PON_HORAINICIAL_BAT').AsString;
  edtHoraSaida.TimeText := dmDados.cdsPONTBBAT.FieldByName('PON_HORAFINAL_BAT').AsString;
end;

function TfrmHorarioPontoEdit.testarDados: Boolean;
begin
  Result := False;

  if (Operacao = OpIncluir) or (Operacao = OpAlterar) then
  begin
    if (edtHoraEntrada.TimeText = '') or
        (edtHoraEntrada.TimeText = '00:00:00') then
    begin
      ShowMessage('Informe o horário de entrada.');
      if edtHoraEntrada.CanFocus then
        edtHoraEntrada.SetFocus;
      Exit;
    end;
    if (edtHoraSaida.TimeText = '') or
        (edtHoraSaida.TimeText = '00:00:00') then
    begin
      ShowMessage('Informe o horário de saída.');
      if edtHoraSaida.CanFocus then
        edtHoraSaida.SetFocus;
      Exit;
    end
  end;
  Result := True;
end;
end.
