unit botao.base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.UITypes;

type
  TFrameBase = class(TFrame)
    pnlBtnFundo: TPanel;
    pnlImg: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    lblTitulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}



end.
