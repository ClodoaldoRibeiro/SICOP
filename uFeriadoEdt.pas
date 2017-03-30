unit uFeriadoEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, EDateEd, Vcl.Grids, Vcl.Samples.Calendar, Vcl.ComCtrls, Vcl.DBCtrls;

type

  TOperacao = (OpIncluir, OpAlterar, OpExcluir);

  TfrmFeriadoEdt = class(TForm)
    pnlRodape: TPanel;
    pnlControle: TPanel;
    btnFechar: TBitBtn;
    btnOK: TBitBtn;
    lblDescrição: TLabel;
    edtDescricao: TEdit;
    dtpDate: TDateTimePicker;
    lblData: TLabel;
    lblTipoFeriado: TLabel;
    cbbTipoFeriado: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregarRegistro;
    procedure CarregarDadosPONTBTPF;
    procedure CarregarDadosCbbTipoFeriado;
    procedure MoverDadosFormularios;

    function testarDados: Boolean;
    function incluir: Boolean;
    function alterar: Boolean;
    function excluir: Boolean;

  public
    { Public declarations }
    gOperacao: TOperacao;
    gPON_PK_SEQ_FER: Integer;

  end;

var
  frmFeriadoEdt: TfrmFeriadoEdt;

implementation

{$R *.dfm}

uses uDmDados, uConstates, uTipoFeriado, uFeriado;

{ TfrmTipoFeriadoEdt }

function TfrmFeriadoEdt.alterar: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBFER.IsEmpty then
  begin
    try
      dmDados.cdsPONTBFER.Edit;
      dmDados.cdsPONTBFER.FieldByName('PON_DATA_FER').AsDateTime := dtpDate.Date;
      dmDados.cdsPONTBFER.FieldByName('PON_DESC_FER').AsString := edtDescricao.Text;
      dmDados.cdsPONTBFER.FieldByName('PON_FK_TPF_FER').AsInteger := ( cbbTipoFeriado.ItemIndex + 1);
      dmDados.cdsPONTBFER.Post;
      dmDados.cdsPONTBFER.ApplyUpdates(0);

      frmFeriado.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao alterar tipo de feriado: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmFeriadoEdt.btnOKClick(Sender: TObject);
begin
  if testarDados then
  begin
    if gOperacao = OpIncluir then
    begin
      if incluir then
      begin
        ShowMessage('Registro incluso com sucesso!');
        edtDescricao.Text := '';
        cbbTipoFeriado.ItemIndex := -1;
        dtpDate.Date := Now;
        if dtpDate.CanFocus then
          dtpDate.SetFocus;
      end;
    end
    else if gOperacao = OpAlterar then
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

procedure TfrmFeriadoEdt.carregarRegistro;
begin
  dmDados.cdsPONTBFER.Close;
  dmDados.cdsPONTBFER.CommandText :=  ' SELECT * FROM PONTBFER FER ' +
                                      '     LEFT OUTER JOIN PONTBTPF TPF ON FER.PON_FK_TPF_FER = TPF.PON_PK_SEQ_TPF' +
                                      '   WHERE FER.PON_PK_SEQ_FER = ' + QuotedStr(VarToStr(gPON_PK_SEQ_FER));
  dmDados.cdsPONTBFER.Open;
end;

function TfrmFeriadoEdt.excluir: Boolean;
begin
  carregarRegistro;
  if not dmDados.cdsPONTBFER.IsEmpty then
  begin
    try
      dmDados.cdsPONTBFER.Delete;
      dmDados.cdsPONTBFER.ApplyUpdates(0);
      frmFeriado.AtualizaGrid;
    except
      on e: Exception do
      begin
        ShowMessage('Erro ao ecluir tipo de feriado: ' + e.Message);
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmFeriadoEdt.FormShow(Sender: TObject);
begin
  dmDados.cdsPONTBFER.Close;
  dmDados.cdsPONTBFER.CommandText := 'SELECT * FROM PONTBFER';
  dmDados.cdsPONTBFER.Open;

  if gOperacao = OpIncluir then
  begin
    Caption := 'Inclusão de feriado';
    CarregarDadosCbbTipoFeriado;
    dtpDate.Date := Now;
    dtpDate.SetFocus;
  end
  else if gOperacao = OpAlterar then
  begin
    Caption := 'Alteração de feriado';
    carregarRegistro;
    MoverDadosFormularios;
    CarregarDadosPONTBTPF;
    frmFeriado.AtualizaGrid;
  end
  else
  begin
    Caption := 'Exclusão de feriado';
    carregarRegistro;
    MoverDadosFormularios;
    CarregarDadosPONTBTPF;
    frmFeriado.AtualizaGrid;
    pnlControle.Enabled := False;
    btnOK.SetFocus;
  end;
end;

function TfrmFeriadoEdt.incluir: Boolean;
begin
  try

    dmDados.cdsPONTBFER.EmptyDataSet;
    dmDados.cdsPONTBFER.Close;
    dmDados.cdsPONTBFER.CommandText := 'SELECT * FROM PONTBFER';
    dmDados.cdsPONTBFER.Open;

    dmDados.cdsPONTBFER.Insert;
    dmDados.cdsPONTBFER.FieldByName('PON_PK_SEQ_FER').AsInteger := 0;
    dmDados.cdsPONTBFER.FieldByName('PON_DATA_FER').AsDateTime := dtpDate.Date;
    dmDados.cdsPONTBFER.FieldByName('PON_DESC_FER').AsString := edtDescricao.Text;
    dmDados.cdsPONTBFER.FieldByName('PON_FK_TPF_FER').AsInteger := ( cbbTipoFeriado.ItemIndex + 1);
    dmDados.cdsPONTBFER.Post;
    dmDados.cdsPONTBFER.ApplyUpdates(0);

    frmFeriado.AtualizaGrid;
  except
    on e: Exception do
    begin
      ShowMessage('Erro ao inserir feriado: ' + e.Message);
    end;
  end;
  Result := True;
end;

procedure TfrmFeriadoEdt.MoverDadosFormularios;
begin
  dtpDate.Date := dmDados.cdsPONTBFER.FieldByName('PON_DATA_FER').AsDateTime;
  edtDescricao.Text := dmDados.cdsPONTBFER.FieldByName('PON_DESC_FER').AsString;
  CarregarDadosCbbTipoFeriado;
  carregarRegistro;
  cbbTipoFeriado.ItemIndex := (dmDados.cdsPONTBFER.FieldByName('PON_FK_TPF_FER').AsInteger - 1);

end;

function TfrmFeriadoEdt.testarDados: Boolean;
begin
  Result := False;

  if (gOperacao = OpIncluir) or (gOperacao = OpAlterar) then
  begin
    if cbbTipoFeriado.ItemIndex = -1 then
    begin
      ShowMessage('Selecione o tipo de Feriado.');
      if cbbTipoFeriado.CanFocus then
        cbbTipoFeriado.SetFocus;
      Exit;
    end;

    if edtDescricao.Text = '' then
    begin
      ShowMessage('Informe a descrição do Feriado.');
      if edtDescricao.CanFocus then
        edtDescricao.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmFeriadoEdt.CarregarDadosCbbTipoFeriado;
begin
  CarregarDadosPONTBTPF;

  while not dmDados.cdsPONTBTPF.Eof do
  begin
    cbbTipoFeriado.AddItem(dmDados.cdsPONTBTPF.FieldByName('PON_DESC_TPF')
      .AsString, TObject(dmDados.cdsPONTBTPF.FieldByName('PON_PK_SEQ_TPF')
      .AsInteger));
    dmDados.cdsPONTBTPF.Next;
  end;
  cbbTipoFeriado.ItemIndex := -1;
end;

procedure TfrmFeriadoEdt.CarregarDadosPONTBTPF;
begin
  dmDados.cdsPONTBTPF.Close;
  dmDados.cdsPONTBTPF.CommandText := 'SELECT * FROM PONTBTPF';
  dmDados.cdsPONTBTPF.Open;
end;

end.
