program oos;

uses
  Forms,
  frmOOS in 'frmOOS.pas' {frm_OOS},
  _frEditSave in '_frames\_frEditSave.pas' {fr_EditSave: TFrame},
  uOOS in '_unit\uOOS.pas',
  Registry,
  Windows,
  Classes,
  frmSetNumZone in '_forms\frmSetNumZone.pas' {frm_SetNumZone};

{$R *.res}

begin
  if (ParamCount > 0)and(ParamStr(1) = '-admin') then
   flAdmin:= true else flAdmin:= false;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_OOS, frm_OOS);
  Application.Run;
end.
