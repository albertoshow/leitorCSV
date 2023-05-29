unit untLeitorCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Data.DB,
  Vcl.Grids, Vcl.DBGrids, botao.base, botao.Importar, botao.Salvar,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.WinXPanels, IniFiles,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.DApt, FireDAC.Phys.IBBase,
  FireDAC.Comp.BatchMove.SQL, FireDAC.Stan.StorageBin;

type
  TfrmLeitorCSV = class(TForm)
    Panel1: TPanel;
    btnBuscar: TSpeedButton;
    ImageList1: TImageList;
    OpenDialog: TOpenDialog;
    Panel3: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    pnlBtnFechar: TPanel;
    btnFechar: TSpeedButton;
    Panel2: TPanel;
    Label3: TLabel;
    edtPathArquivo: TEdit;
    dbgDados: TDBGrid;
    pnlBotoes: TPanel;
    FrameBtnImportar: TFrameBtnImportar;
    FrameBtnSalvar: TFrameBtnSalvar;
    dsDados: TDataSource;
    mtDados: TFDMemTable;
    mtDadosdt_autorizacao: TDateField;
    mtDadosbandeira: TStringField;
    mtDadosfm_pagto: TStringField;
    mtDadosqtd_parcelas: TIntegerField;
    mtDadosresumo_operacao: TStringField;
    mtDadostaxa: TFloatField;
    mtDadosprev_pgto: TDateField;
    mtDadoscanal_venda: TStringField;
    mtDadosnum_maquina: TStringField;
    mtDadoscod_venda: TStringField;
    mtDadoscod_autorizacao: TStringField;
    mtDadosNSU: TStringField;
    mtDadosnum_cartao: TStringField;
    mtDadostipo_captura: TStringField;
    mtDadosreceba_rapido: TStringField;
    mtDadosnum_nf: TStringField;
    mtDadostx_embarque: TFloatField;
    mtDadosstatus: TStringField;
    FDBatchMoveTextReader: TFDBatchMoveTextReader;
    mtDadosdt_venda: TDateTimeField;
    FDBatchMove: TFDBatchMove;
    FDBatchMoveDataSetWriter: TFDBatchMoveDataSetWriter;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    mtDadosvlr_venda: TStringField;
    mtDadosvlr_desconto: TStringField;
    mtDadostarifa: TStringField;
    mtDadosvlr_liquido: TStringField;
    mtDadoscomissao_minima: TStringField;
    mtDadosvlr_entrada: TStringField;
    mtDadosvlr_saque: TStringField;
    ListBox1: TListBox;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    Card3: TCard;
    Label4: TLabel;
    edtPathBanco: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    edtUsuario: TEdit;
    Label6: TLabel;
    edtSenha: TEdit;
    Label7: TLabel;
    edtPorta: TEdit;
    Label8: TLabel;
    edtServidor: TEdit;
    Label9: TLabel;
    edtProtocolo: TEdit;
    edtDeleteLinhas: TEdit;
    Label10: TLabel;
    btnSalvarIni: TSpeedButton;
    Label11: TLabel;
    edtTabela: TEdit;
    Conn: TFDConnection;
    TabDados: TFDTable;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    Label12: TLabel;
    edtPathDll: TEdit;
    btnBsucarDll: TSpeedButton;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter;
    pnlMsg: TPanel;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FrameBtnImportarlblTituloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnSalvarIniClick(Sender: TObject);
    procedure btnBsucarDllClick(Sender: TObject);
    procedure FrameBtnSalvarlblTituloClick(Sender: TObject);
    procedure FrameBtnImportarImage1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDBatchMove1Progress(ASender: TObject; APhase: TFDBatchMovePhase);
  private
    { Private declarations }
    FDeleteLinhas : Integer;
    FTableName: string;
    procedure GravarIni;
    procedure LerIni;
    procedure ConfigConexao;
    procedure FecharTabelas;


  public
    { Public declarations }

  end;

var
  frmLeitorCSV: TfrmLeitorCSV;

implementation

{$R *.dfm}

procedure TfrmLeitorCSV.btnBsucarDllClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := '*dll';
  OpenDialog.Filter := 'fbclient|*.dll';
  if OpenDialog.Execute then
  edtPathDll.Text := OpenDialog.FileName;
end;

procedure TfrmLeitorCSV.btnBuscarClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := '*csv';
  OpenDialog.Filter := 'CSV|*.csv';
  if OpenDialog.Execute then
  edtPathArquivo.Text := OpenDialog.FileName;
end;

procedure TfrmLeitorCSV.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog.DefaultExt := '*fdb';
  OpenDialog.Filter := 'Firebird|*.fdb';
  if OpenDialog.Execute then
  edtPathBanco.Text := OpenDialog.FileName;
end;

procedure TfrmLeitorCSV.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLeitorCSV.btnSalvarIniClick(Sender: TObject);
begin
  GravarIni;
  LerIni;
  CardPanel1.ActiveCard := Card2;
end;

procedure TfrmLeitorCSV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharTabelas;
end;

procedure TfrmLeitorCSV.FDBatchMove1Progress(ASender: TObject;
  APhase: TFDBatchMovePhase);
begin
  case Aphase of
    psPreparing: pnlMsg.Caption := 'Preparando ...';
    psStarting:  pnlMsg.Caption := 'Iniciando ...';
    psProgress:  pnlMsg.Caption := 'Criando ...';
    psFinishing: pnlMsg.Caption := 'Terminando ...';
    psUnpreparing: pnlMsg.Caption := 'Processo terminado';
  end;
end;

procedure TfrmLeitorCSV.FecharTabelas;
begin
  Conn.Connected := False;
  TabDados.Close;
  mtDados.Close;
end;

procedure TfrmLeitorCSV.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card2;
  LerIni;
end;

procedure TfrmLeitorCSV.FrameBtnImportarImage1Click(Sender: TObject);
begin
  if CardPanel1.ActiveCardIndex = 0 then
    CardPanel1.ActiveCard := Card2
  else
    CardPanel1.ActiveCard := Card1;
end;

procedure TfrmLeitorCSV.FrameBtnImportarlblTituloClick(Sender: TObject);
var
  I : integer;
  lista : TMemoryStream;
begin
  if trim(edtPathArquivo.Text) <> '' then
  begin
    try
      lista := TMemoryStream.Create;
      lista.Clear;
      listbox1.Items.LoadFromFile(edtPathArquivo.Text, TEncoding.ANSI);

      for I := 0 to FDeleteLinhas - 1 do
        listBox1.Items.Delete(0);

      listbox1.Items.SaveToStream(lista);
      lista.Position := 0;
      FDBatchMoveTextReader.Stream := lista;
      FDBatchMove.Execute;
    finally
      lista.Free;
      pnlMsg.Caption := 'Arquivo carregado';
    end;
  end;
end;

procedure TfrmLeitorCSV.FrameBtnSalvarlblTituloClick(Sender: TObject);
begin
  TabDados.TableName := FTableName;
  FDBatchMove1.Mappings.AddAll;
  FDBatchMove1.Execute;

end;

procedure TfrmLeitorCSV.GravarIni;
var
  IniFile : String;
  Ini : TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteString('BANCO_DADOS','Database', edtPathBanco.Text);
    Ini.WriteString('BANCO_DADOS','Dll', edtPathDll.Text);
    Ini.WriteString('BANCO_DADOS','Protocol', edtProtocolo.Text);
    Ini.WriteString('BANCO_DADOS','Server',   edtServidor.Text);
    Ini.WriteInteger('BANCO_DADOS','Porta',   StrToInt(edtPorta.Text));
    Ini.WriteString('BANCO_DADOS','User',     edtUsuario.Text);
    Ini.WriteString('BANCO_DADOS','Password', edtSenha.Text);
    Ini.WriteInteger('CONFIG','DeleteLinhas', strToInt(edtDeleteLinhas.Text));
    Ini.WriteString('CONFIG','Tabela',        edtTabela.Text);

  finally
    Ini.Free;
  end;
end;

procedure TfrmLeitorCSV.Image1Click(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card3;
end;

procedure TfrmLeitorCSV.LerIni;
var
  IniFile : String;
  Ini : TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    edtPathBanco.Text  := Ini.ReadString('BANCO_DADOS','Database','');
    edtPathDll.Text  := Ini.ReadString('BANCO_DADOS','Dll','');
    edtProtocolo.Text  := Ini.ReadString('BANCO_DADOS','Protocol','TCPIP');
    edtServidor.Text   := Ini.ReadString('BANCO_DADOS','Server','127.0.0.1');
    edtPorta.Text      := Ini.ReadInteger('BANCO_DADOS','Porta',3050).ToString;
    edtUsuario.Text    := Ini.ReadString('BANCO_DADOS','User','SYSDBA');
    edtSenha.Text      := Ini.ReadString('BANCO_DADOS', 'Password', '');
    edtDeleteLinhas.Text := Ini.ReadInteger('CONFIG','DeleteLinhas', 4).ToString;
    edtTabela.Text := Ini.ReadString('CONFIG','Tabela','tab_teste');
    FDeleteLinhas := Ini.ReadInteger('CONFIG','DeleteLinhas', 4);
    FTableName := Ini.ReadString('CONFIG','Tabela','tab_teste');
  finally
    Ini.Free;
    ConfigConexao;
  end;
end;

procedure TfrmLeitorCSV.ConfigConexao;
begin
      FDPhysFBDriverLink.VendorLib := edtPathDll.text;

      Conn.Params.Values['DriverID']  := 'FB';
      Conn.Params.Values['Port']      := edtPorta.Text;
      Conn.Params.Values['Database']  := edtPathBanco.Text;
      Conn.Params.Values['protocol']  := edtProtocolo.Text;
      Conn.Params.Values['Server']    := edtServidor.Text;
      Conn.Params.Values['User_name'] := edtUsuario.Text;
      Conn.Params.Values['Password']  := edtSenha.Text;
      Conn.OPEN;
      Conn.Close;
end;

end.
