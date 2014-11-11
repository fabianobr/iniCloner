unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmIniCloner = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pbClonarUm: TBitBtn;
    edDestino: TLabeledEdit;
    IniOrigem: TMemo;
    Panel1: TPanel;
    mmArquivos: TMemo;
    pbClonarArquivos: TButton;
    pbClones: TProgressBar;
    procedure pbClonarUmClick(Sender: TObject);
    procedure pbClonarArquivosClick(Sender: TObject);
  private
    FsArquivoOrigem: string;
    procedure GerarIniOrigem;
  public
    { Public declarations }
  end;

var
  frmIniCloner: TfrmIniCloner;

implementation

uses
  uspIniClone;

{$R *.dfm}

procedure TfrmIniCloner.pbClonarUmClick(Sender: TObject);
var
  oClonar: TspIniClone;
begin
  GerarIniOrigem;
  oClonar := TspIniClone.Create(FsArquivoOrigem, edDestino.text);
  try
    oClonar.Clonar;
  finally
    FreeAndNil(oClonar);
  end;
end;

procedure TfrmIniCloner.GerarIniOrigem;
var
  sPastaTemp: string;
begin
  sPastaTemp := GetEnvironmentVariable(PChar('temp'));
  FsArquivoOrigem := sPastaTemp + '\origem.ini';
  IniOrigem.lines.savetofile(FsArquivoOrigem);
end;

procedure TfrmIniCloner.pbClonarArquivosClick(Sender: TObject);
const
  sFORMATO_RESUMO = '%d/%d alterados.';
var
  i, nCont: integer;
  sNaoAlterados,
  sResumo, sArquivoDestino: string;
  oClonar: TspIniClone;
begin
  GerarIniOrigem;
  nCont := 0;
  sNaoAlterados := '';
  oClonar := TspIniClone.Create(FsArquivoOrigem);
  try
    pbClones.Max := mmArquivos.Lines.count;
    pbClones.Position := 0;
    for i := 0 to mmArquivos.Lines.count-1 do
    begin
      sArquivoDestino := mmArquivos.Lines[i];
      if fileExists(sArquivoDestino) then
      begin
        FileSetAttr(sArquivoDestino, 0);

        oClonar.ArquivoDestino := sArquivoDestino;
        oClonar.Clonar;
        inc(nCont);
      end
      else
      begin
        sNaoAlterados := sNaoAlterados + sArquivoDestino + #13#10;
      end;

      pbClones.StepIt;
      pbClones.Repaint;
    end;
  finally
    FreeAndNil(oClonar);
  end;
  sresumo := Format(sFORMATO_RESUMO, [nCont, mmArquivos.Lines.count]);
  showmessage(sresumo+#13#10+sNaoAlterados);
end;

end.
