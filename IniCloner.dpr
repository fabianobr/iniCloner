program IniCloner;

uses
  Forms,
  uMain in 'uMain.pas' {frmIniCloner},
  uspIniClone in 'uspIniClone.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmIniCloner, frmIniCloner);
  Application.Run;
end.
