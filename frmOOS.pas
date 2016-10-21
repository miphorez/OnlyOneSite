unit frmOOS;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, _frEditSave,  Registry,
  mshtml,
  StdCtrls,
  uOOS, ShellApi, Menus;

type
  Tfrm_OOS = class(TForm)
    wb_Site: TWebBrowser;
    p_main: TPanel;
    fr_eSite: Tfr_EditSave;
    p_site: TPanel;
    p_edit: TPanel;
    MainMenu: TMainMenu;
    mi_oos: TMenuItem;
    mi_Exit: TMenuItem;
    mi_ClearURL: TMenuItem;
    N1: TMenuItem;
    mi_OpenList: TMenuItem;
    procedure WMDataFromEditSave(var msg: TMessage); message WM_EDITSAVE;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_GoSiteClick(Sender: TObject);
    procedure wb_SiteBeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure mi_ExitClick(Sender: TObject);
    procedure mi_ClearURLClick(Sender: TObject);
    procedure mi_OpenListClick(Sender: TObject);
  private
    { Private declarations }
    function selectSiteFromList: string;
  public
    { Public declarations }
    SiteAdr: string;
    SiteList: TStringList;
    FalseClick: boolean;
  end;

var
  frm_OOS: Tfrm_OOS;
  sItemSiteAdr:string;
  flAdmin: boolean;

implementation
uses
    frmSetNumZone;

{$R *.dfm}

procedure Tfrm_OOS.FormCreate(Sender: TObject);
begin
SiteList:= TStringList.Create;
end;

procedure Tfrm_OOS.FormDestroy(Sender: TObject);
begin
SiteList.Free;
end;

procedure Tfrm_OOS.FormShow(Sender: TObject);
begin
fr_eSite.SetBtn(70,'Адрес сайта:',false,Handle,nil,'','');
fr_eSite.btn_save.Hint:= 'Адрес сайта';
fr_eSite.SetSaveOpenMode(true,false);
fr_eSite.SetEdit(teSiteAdr, '');
//загрузка сайта, если есть адрес
SiteAdr:= '';
p_edit.Visible:= true;
   sItemSiteAdr:= selectSiteFromList();
   SiteAdr:= sItemSiteAdr;
   Caption:= sPROG_NAME+' ('+SiteAdr+')';
   btn_GoSiteClick(self);
end;

function Tfrm_OOS.selectSiteFromList(): string;
var
  Reg: TRegistry;
  iListAddress: TStringList;
  i: integer;
  frm_ListOfSites: Tfrm_SetNumZone;
  Yes: boolean;
  iStr: string;
begin
Reg:= TRegistry.Create;
Reg.RootKey:= HKEY_CURRENT_USER;

     //запросить количество копий
     frm_ListOfSites := Tfrm_SetNumZone.Create(Application);


  iListAddress:= TStringList.Create;
  Reg.OpenKey(REGKEY_OOS, true);
  Reg.GetValueNames(iListAddress);
  if (iListAddress.Count>0) then begin
     for i:=0 to iListAddress.Count-1 do begin
         iStr:= Reg.ReadString(iListAddress.Strings[i]);
         frm_ListOfSites.ComboBox_Zones.AddItem(iListAddress.Strings[i], TStrURL.Create(iListAddress.Strings[i], iStr));
     end;
  end;
  iListAddress.Free;
  if (frm_ListOfSites.ComboBox_Zones.Items.Count = 0) then begin
          sItemSiteAdr:= SITE_GOOGLE;
  end else begin
     //вызов окна
     frm_ListOfSites.Caption:= 'Список сайтов';
     frm_ListOfSites.Label_StaticText.Caption:= 'Выберите сайт для просмотра';
     frm_ListOfSites.Label_CbSel.Caption:= 'Сайты';
     frm_ListOfSites.ComboBox_Zones.ItemIndex:=0;
     frm_ListOfSites.ShowModal;
     sItemSiteAdr:= TStrURL(frm_ListOfSites.ComboBox_Zones.Items.Objects[frm_ListOfSites.ComboBox_Zones.ItemIndex]).url;
     Yes:= frmSetNumZone.flOK;
     if (not Yes) then sItemSiteAdr:= '';
  end;
     frm_ListOfSites.Free;

Reg.CloseKey;
Reg.Free;
result:= sItemSiteAdr;
end;

procedure Tfrm_OOS.wb_SiteBeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
if (Pos(sItemSiteAdr,URL)=0)and(not flAdmin) then
   Cancel:= true;
end;

procedure Tfrm_OOS.btn_GoSiteClick(Sender: TObject);
begin
wb_Site.Navigate(SiteAdr);
end;

procedure Tfrm_OOS.WMDataFromEditSave(var msg: TMessage);
var
  lp: PChar;
  signAdr: string;
  Reg: TRegistry;
begin
case msg.WParam of

WM_EDITSAVE_SITEADR: begin  //ввод названия сайта
   lp := PChar(msg.lParam);
   SiteAdr:= string(lp);
   if not flAdmin then begin
      SiteAdr:= XorHexDataToStr(SiteAdr);
   end;
   signAdr:= DelLeftRightSpace(InputBox('Введите сигнатуру сайта','Сигнатура:',SiteAdr));
   if signAdr<>'' then begin
        Reg:= TRegistry.Create;
        Reg.RootKey:= HKEY_CURRENT_USER;
        Reg.OpenKey(REGKEY_OOS,true);
        Reg.WriteString(signAdr, SiteAdr);
        Reg.CloseKey;
        Reg.Free;
   end;
   sItemSiteAdr:= SiteAdr;
   btn_GoSiteClick(self);
end;

WM_EDITSAVE_CODING: begin  //кодирование названия сайта
   lp := PChar(msg.lParam);
   signAdr:= string(lp);
   signAdr:= StrToXorHexData(signAdr);
   signAdr:= DelLeftRightSpace(InputBox('Получите кодированный URL','HexURL:',signAdr));
end;

end;
end;

procedure Tfrm_OOS.mi_ClearURLClick(Sender: TObject);
var
   Reg: TRegistry;
  iListAddress: TStringList;
  i: integer;
begin
Reg:= TRegistry.Create;
Reg.RootKey:= HKEY_CURRENT_USER;

  iListAddress:= TStringList.Create;
  Reg.OpenKey(REGKEY_OOS, true);
  Reg.GetValueNames(iListAddress);
  if (iListAddress.Count>0) then begin
     for i:=0 to iListAddress.Count-1 do
         Reg.DeleteValue(iListAddress.Strings[i]);
  end;
  iListAddress.Free;
Reg.CloseKey;
Reg.Free;
end;

procedure Tfrm_OOS.mi_ExitClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_OOS.mi_OpenListClick(Sender: TObject);
begin
   sItemSiteAdr:= selectSiteFromList();
   SiteAdr:= sItemSiteAdr;
   Caption:= sPROG_NAME+' ('+SiteAdr+')';
   btn_GoSiteClick(self);
end;

end.
