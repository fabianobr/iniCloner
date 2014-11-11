unit uspIniClone;

interface

uses
  IniFiles, Classes, SysUtils;

type
  TspIniClone = class
  private
    FoIniOrigem,
    FoIniDestino: TIniFile;
    FsArquivoDestino: string;
    procedure SetArquivoDestino(const Value: string);
  public
    constructor Create(psOrigem, psDestino: string); overload;
    constructor Create(psOrigem: string); overload;
    destructor Destroy; override;
    procedure Clonar;
  published
    property ArquivoDestino: string read FsArquivoDestino write SetArquivoDestino;
  end;

implementation

{ TspIniClone }

procedure TspIniClone.Clonar;
var
  i, j: integer;
  oSecoes, oValores: TStringList;
  sName, sValue: string;
begin
  oSecoes := TStringList.Create;
  oValores := TStringList.Create;
  try
    FoIniOrigem.ReadSections(oSecoes);
    for i := 0 to oSecoes.Count-1 do
    begin
      FoIniOrigem.ReadSectionValues(oSecoes[i], oValores);
      for j := 0 to oValores.Count-1 do
      begin
        sName := oValores.Names[j];
        sValue := oValores.ValueFromIndex[j];
        FoIniDestino.WriteString(oSecoes[i], sName, sValue);
      end;
    end;
  finally
    FreeAndNil(oSecoes);
    FreeAndNil(oValores);
  end;

end;

constructor TspIniClone.Create(psOrigem, psDestino: string);
begin
  FoIniOrigem := TIniFile.Create(psOrigem);
  ArquivoDestino := psDestino;
end;

constructor TspIniClone.Create(psOrigem: string);
begin
  FoIniOrigem := TIniFile.Create(psOrigem);
end;

destructor TspIniClone.Destroy;
begin
  FreeAndNil(FoIniOrigem);
  FreeAndNil(FoIniDestino);
  inherited;
end;

procedure TspIniClone.SetArquivoDestino(const Value: string);
begin
  FsArquivoDestino := Value;
  if Assigned(FoIniDestino) then
    FreeAndNil(FoIniDestino);
  FoIniDestino := TIniFile.Create(FsArquivoDestino);
end;

end.
 