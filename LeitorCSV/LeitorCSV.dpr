program LeitorCSV;

uses
  Vcl.Forms,
  untLeitorCSV in 'untLeitorCSV.pas' {frmLeitorCSV},
  botao.base in 'botao.base.pas' {FrameBase: TFrame},
  botao.Importar in 'botao.Importar.pas' {FrameBtnImportar: TFrame},
  botao.Salvar in 'botao.Salvar.pas' {FrameBtnSalvar: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLeitorCSV, frmLeitorCSV);
  Application.Run;
end.
