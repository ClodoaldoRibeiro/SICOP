unit uMsgUsuarioSemOutorizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrnUsuarioSemAutorizacao = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    btnOK: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frnUsuarioSemAutorizacao: TfrnUsuarioSemAutorizacao;

implementation

{$R *.dfm}

end.
