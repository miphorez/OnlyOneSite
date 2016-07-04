unit _frEditSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus,
  uOOS, Registry;

type
  TTypeEdit = (teNone,
              teSiteAdr
  );

type
  Tfr_EditSave = class(TFrame)
    p_edit: TPanel;
    p_name: TPanel;
    btn_save: TSpeedButton;
    btn_open: TSpeedButton;
    p_text: TPanel; 
    e_text: TEdit;
    procedure btn_saveClick(Sender: TObject);
    procedure btn_openClick(Sender: TObject);
    procedure e_textChange(Sender: TObject);
    procedure e_textClick(Sender: TObject);
    procedure e_textKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure e_textKeyPress(Sender: TObject; var Key: Char);
  private
    FocusComp: TWinControl;
    SaveField: string;
    SaveFieldID: string;
    SaveTable: string;
    flEdit: boolean;
    SaveMode, OpenMode: boolean;
    flDel, flAutoSelect: boolean;
    flAdminControl: boolean;
    LimitMode: TLimitType;
    smHandle: THandle;
    iTypeEdit: TTypeEdit;
    LimitValue: integer;
    EnabledMode: boolean;
//    function GetItemPath: string;
    { Private declarations }
  public
    { Public declarations }
    OldEdit:string;
    FalseClick: boolean;
    procedure SetEnabledMode(iVal: boolean);
    procedure SetLimitValue(iVal: Integer);
    procedure SetSaveOpenMode(flSave, flOpen: boolean);
    procedure SetLimitMode(tLimit: TLimitType);
    procedure ResetEdit(flReset: boolean);
    procedure SetBtn(widthName: integer; textName:string; fontMode: boolean;
              pHandle: THandle; fComp: TWinControl; sTable, sField: string);
    procedure SetEdit(iTE: TTypeEdit; signAdr: string); overload;
    procedure SetEdit(textString: string); overload;
    function GetStr: string;
  end;

implementation

{$R *.dfm}

procedure Tfr_EditSave.btn_openClick(Sender: TObject);
begin
  flEdit:= true;
  p_text.Color:= clWhite;
  e_text.Color:= clWhite;
  OldEdit:= e_text.Text;
  Application.ProcessMessages;
  btn_save.Enabled:= true;
//вызов функции открыть диалог выбора файла из родителя
case iTypeEdit of
     teSiteAdr:;// SendMessage(smHandle, WM_SM_FOR_SETTINGS, CMD_SETTNGS_SYS_OPENFILE, 0);
end;
end;

function Tfr_EditSave.GetStr: string;
begin
result:= DelLeftRightSpace(e_text.Text);
end;

procedure Tfr_EditSave.btn_saveClick(Sender: TObject);
begin
if e_text.Color <> clWhite then Exit;
if iTypeEdit = teNone then begin
end else begin
   case iTypeEdit of
     teSiteAdr: begin
                   SendMessage(smHandle, WM_EDITSAVE, WM_EDITSAVE_SITEADR, DWORD(PChar(DelLeftRightSpace(e_text.Text))));
     end;
   end;

end;
ResetEdit(false);
end;

procedure Tfr_EditSave.SetSaveOpenMode(flSave, flOpen: boolean);
begin
  SaveMode:= flSave;
  if flSave then begin
     btn_save.Visible:= true;
     btn_save.Enabled:= false;
  end else btn_save.Visible:= false;
  if flOpen then btn_open.Visible:= true else btn_open.Visible:= false;
end;

procedure Tfr_EditSave.e_textChange(Sender: TObject);
begin
if FalseClick then Exit;
if e_text.ReadOnly then Exit;
if (LimitMode=ltOnlyDigit)and(LimitValue<>0)and(e_text.Text<>'') then
   if StrToInt(e_text.Text)>LimitValue then
      e_text.Text:= IntToStr(LimitValue);

//del, back - пропускаем
if flDel then begin
   flDel:= false;
   flAutoSelect:= false;
   Exit;
end;
end;

procedure Tfr_EditSave.e_textClick(Sender: TObject);
begin
if e_text.Color = clWhite then Exit;

if not EnabledMode then begin
   if FocusComp<>nil then FocusComp.SetFocus;
   Exit;
end;
if not SaveMode then begin
   if FocusComp<>nil then FocusComp.SetFocus;
   Exit;
end;
  flEdit:= true;
  e_text.ReadOnly:= false;
  p_text.Color:= clWhite;
  e_text.Color:= clWhite;
  OldEdit:= e_text.Text;
  btn_save.Enabled:= true;
  e_text.SetFocus;
end;

procedure Tfr_EditSave.e_textKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//Ctrl+Shift+H режим кодирования
   if (Key=Ord('H'))and(ssCtrl in Shift)and(ssShift in Shift)and(ssAlt in Shift) then begin
      SendMessage(smHandle, WM_EDITSAVE, WM_EDITSAVE_CODING, DWORD(PChar(DelLeftRightSpace(e_text.Text))));
   end;
//Enter
   if Ord(Key)=13 then btn_saveClick(self);
//Escape
   if Ord(Key)=27 then begin
      //стать в начало строки
      keybd_event(VK_HOME, 0, 0, 0);
      keybd_event(VK_HOME, 0, KEYEVENTF_KEYUP, 0);
      Application.ProcessMessages;
      ResetEdit(true);
   end;
//del, back
   if ((Ord(Key)=46)or(Ord(Key)=8))and flAutoSelect then begin
      flDel:= true;
   end;
end;

procedure Tfr_EditSave.e_textKeyPress(Sender: TObject; var Key: Char);
begin
//проверка ограничений на ввод
if (LimitMode = ltOnlyDigit) then
   if (not (Key in ['0'..'9', #8])) then Key:= #0;
if (LimitMode = ltOnlyCyr) then
   if (not (Key in ['а'..'я', 'А'..'Я', #8])) then Key:= #0;
end;

procedure Tfr_EditSave.ResetEdit(flReset: boolean);
begin
if FalseClick then Exit;
FalseClick:=true;
  p_text.Color:= clBtnFace;
  e_text.Color:= clBtnFace;
  if (flReset and (OldEdit<>''))or
     (flReset and flEdit) then e_text.Text:= OldEdit;
  OldEdit:= '';
  flEdit:= false;
  btn_save.Enabled:= false;
  e_text.ReadOnly:= true;
if FocusComp<>nil then FocusComp.SetFocus;
FalseClick:=false;
end;

procedure Tfr_EditSave.SetBtn(widthName: integer; textName: string;
  fontMode: boolean;
  pHandle: THandle; fComp: TWinControl; sTable, sField: string);
begin
  iTypeEdit:= teNone;
  smHandle:= pHandle;
  LimitValue:= 0;
  EnabledMode:= true;
FalseClick:=true;
  p_name.Width:= widthName;
  p_name.Caption:= textName;
  e_text.Text:= '';
  FocusComp:= fComp;
  SaveTable:=  sTable;
  SaveField:= sField;
  SaveFieldID:= '';
  SaveMode:= true;
  OpenMode:= true;
  flDel:= false;
  flAutoSelect:= false;
  flEdit:= false;
  LimitMode:= ltNone;
  flAdminControl:= false; //не реагировать на flAdmin

  btn_save.Visible:= false;
  btn_open.Visible:= false;
  p_text.Color:= clBtnFace;
  e_text.Color:= clBtnFace;
  //вид шрифта
  if not fontMode then begin
     e_text.Font.Color:= clWindowText;
     e_text.Font.Style:= [];
  end else begin
     e_text.Font.Color:= $002E2E2E;
     e_text.Font.Style:= [fsBold];
  end;
FalseClick:=false;
end;

procedure Tfr_EditSave.SetEdit(textString: string);
begin
e_text.Text:= textString;
end;

procedure Tfr_EditSave.SetLimitMode(tLimit: TLimitType);
begin
  LimitMode:= tLimit;
end;

procedure Tfr_EditSave.SetLimitValue(iVal: Integer);
begin
  LimitValue:= iVal;
end;

procedure Tfr_EditSave.SetEnabledMode(iVal: boolean);
begin
  EnabledMode:= iVal;
  ResetEdit(true);
  if EnabledMode then begin
     p_name.Font.Color:= clWindowText;
     e_text.Font.Color:= clWindowText;
  end else begin
     p_name.Font.Color:= clGray;
     e_text.Font.Color:= clBtnFace;
  end;
end;

procedure Tfr_EditSave.SetEdit(iTE: TTypeEdit;  signAdr: string);
//var Reg: TRegistry;
//  iStr: string;
begin
iTypeEdit:= iTE;
FalseClick:= true;
case iTypeEdit of
    //читаем из реестра параметры подключения сервера
     teSiteAdr: begin
//        Reg:= TRegistry.Create;
//        Reg.RootKey:= HKEY_LOCAL_MACHINE;
//        Reg.OpenKey(REGKEY_OOS,true);
//        iStr:=   Reg.ReadString(REGVAL_SITEADR);
//        if iStr = '' then e_text.Text:= '' else e_text.Text:= iStr;
//        Reg.CloseKey;
//        Reg.Free;
     end;
end;
FalseClick:= false;
end;

end.
