unit frmSetNumZone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, ADODB;

type
  Tfrm_SetNumZone = class(TForm)
    btn_OK: TButton;
    btn_Exit: TButton;
    Panel_Adr: TPanel;
    Label_CbSel: TLabel;
    ComboBox_Zones: TComboBox;
    Label_StaticText: TLabel;
    Panel1: TPanel;
    p_Text: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    procedure btn_OKClick(Sender: TObject);
    procedure ComboBox_ZonesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flOK:boolean;

implementation

{$R *.DFM}

procedure Tfrm_SetNumZone.btn_OKClick(Sender: TObject);
begin
flOK:=true;
end;

procedure Tfrm_SetNumZone.ComboBox_ZonesChange(Sender: TObject);
begin
btn_OK.SetFocus;
end;

procedure Tfrm_SetNumZone.FormCreate(Sender: TObject);
begin
flOK:=false;
end;

procedure Tfrm_SetNumZone.FormShow(Sender: TObject);
begin
p_Text.Caption:= Label_CbSel.Caption;
btn_OK.SetFocus;
end;

end.
