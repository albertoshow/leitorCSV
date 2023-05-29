unit botao.Salvar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, botao.base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrameBtnSalvar = class(TFrameBase)
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblTituloMouseEnter(Sender: TObject);
    procedure lblTituloMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameBtnSalvar: TFrameBtnSalvar;

implementation

{$R *.dfm}

procedure TFrameBtnSalvar.lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlBtnFundo.Color := $00C57C02;
end;

procedure TFrameBtnSalvar.lblTituloMouseEnter(Sender: TObject);
begin
  inherited;
  pnlBtnFundo.Color := $0045A728;
end;

procedure TFrameBtnSalvar.lblTituloMouseLeave(Sender: TObject);
begin
  inherited;
  pnlBtnFundo.Color := $0050C600;
end;

end.
