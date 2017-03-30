unit uSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmSobre = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    lblempresa: TLabel;
    lblEmail: TLabel;
    lblSistemaOperacional: TLabel;
    lblMemoriaAvaliada: TLabel;
    lblVersao: TLabel;
    pnl2: TPanel;
    btnOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

uses uFuncoes;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  lblSistemaOperacional.Caption := 'Sistema operacional ' + uFuncoes.getSO;
  lblMemoriaAvaliada.Caption    := 'Memória do sistema ' + IntToStr(uFuncoes.getMemoriaFisicaMb) + ' Mb';
end;
procedure TfrmSobre.img1Click(Sender: TObject);
begin
  ShowMessage('CTI Sistemas, é uma empresa brasileira de serviço de desenvolvimento de software.' + #13 +
              'A CTI desenvolve uma série de serviços e produtos ' + #13 + #13 +

              'Fundada em: 20 de Novembro de 2016, Petrolina, Pernambuco, Brasil ' + #13 +
              'Sede: Petrolina, Pernanbuco, Brasil ' + #13 +
              'Fundador: Clodoaldo Ribeiro Santos');
end;

end.
