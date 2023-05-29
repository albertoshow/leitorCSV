unit botao.Importar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, botao.base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrameBtnImportar = class(TFrameBase)
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
  FrameBtnImportar: TFrameBtnImportar;

implementation

{$R *.dfm}

procedure TFrameBtnImportar.lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlBtnFundo.Color := $00516350;
end;

procedure TFrameBtnImportar.lblTituloMouseEnter(Sender: TObject);
begin
  inherited;
  pnlBtnFundo.Color := $0045A728;
end;

procedure TFrameBtnImportar.lblTituloMouseLeave(Sender: TObject);
begin
  inherited;
  pnlBtnFundo.Color := $0050C600;
end;

end.
