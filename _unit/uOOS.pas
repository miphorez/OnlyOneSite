unit uOOS;
interface
uses
  Messages, SysUtils;

const
  sPROG_NAME = 'Только один сайт';
  REGKEY_OOS = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\OnlyOneSite';
  REGVAL_SITEADR = 'SiteAddress';
  SIGNATURE_OOS = 'OnlyOneSite';
  //-
  SITE_GOOGLE = 'www.google.com';

  WM_CLOSEPROG = WM_USER + 1; //закрыть программу
  WM_TWOEXEC   = WM_USER + 2; //запуск второй копии
  WM_HIDE      = WM_USER + 3;
  //команды из модулей
  WM_EDITSAVE = WM_USER + 1001;
     WM_EDITSAVE_SITEADR = 1;
     WM_EDITSAVE_CODING  = 2;

  //шифрование в реестре данных доступа к базе
  XOR_BinaryData  = 'sdaswan';

type
  TLimitType = (
  ltNone,
  ltOnlyCyr,
  ltOnlyDigit
  );


type
  TStrURL = class(TObject)
    urlName: string;
    url: string;
    constructor Create(urlName_:string; url_:string);
  end;

function DelLeftRightSpace(ItemStr:string): string;
function StrToXorHexData(_str: string): string;
function XorHexDataToStr(_str: string): string;

implementation

{Удалить пробелы слева и справа}
function DelLeftRightSpace(ItemStr:string): string;
var len:integer;
begin
if Length(ItemStr)>0 then
   while (Length(ItemStr)>0) do
         if (ItemStr[1]=' ') then Delete(ItemStr,1,1) else break;
if Length(ItemStr)>0 then
   while 1=1 do begin
    len:= Length(ItemStr);
    if ItemStr[len]=' ' then Delete(ItemStr,len,1) else break;
   end;
Result:= ItemStr;
end;

function StrToXorHexData(_str: string): string;
var
    i,ii, d:integer;
    s: string;
begin
s:='';
//зашифровать в реестре строку
ii:=1;
for i:=1 to length(_str) do begin
    d:= ord(_str[i]) xor ord(XOR_BinaryData[ii]);
    s:= s + IntToHex(d, 2);
    inc(ii);
    if ii = length(XOR_BinaryData)+1 then ii:=1;
end;
result:=s;
end;

function XorHexDataToStr(_str: string): string;
var s, iStr, hs: string;
    d, ii:integer;
begin
//расшифровать из реестра
ii:=1;
s:= ''; iStr:= _str;
while Length(istr) > 0 do begin
    hs:= iStr[1]; hs:= hs + iStr[2];
    d:= StrToInt('$'+hs);
    s:= s + char(d xor ord(XOR_BinaryData[ii]));
    inc(ii);
    if ii = length(XOR_BinaryData)+1 then ii:=1;
    Delete(iStr,1,2);
end;
result:= s;
end;

{ TStrURL }

constructor TStrURL.Create(urlName_, url_: string);
begin
urlName:= urlName_;
url:= url_;
end;

end.
