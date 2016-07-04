object frm_OOS: Tfrm_OOS
  Left = 0
  Top = 0
  Caption = #1058#1086#1083#1100#1082#1086' '#1086#1076#1080#1085' '#1089#1072#1081#1090
  ClientHeight = 682
  ClientWidth = 1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object p_main: TPanel
    Left = 0
    Top = 0
    Width = 1060
    Height = 682
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object p_site: TPanel
      Left = 0
      Top = 27
      Width = 1060
      Height = 655
      Margins.Top = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object wb_Site: TWebBrowser
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1054
        Height = 649
        Align = alClient
        TabOrder = 0
        OnBeforeNavigate2 = wb_SiteBeforeNavigate2
        ExplicitLeft = 6
        ExplicitTop = 0
        ControlData = {
          4C000000EF6C0000134300000100000001020000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620E000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object p_edit: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 1054
      Height = 20
      Margins.Top = 5
      Margins.Bottom = 2
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      inline fr_eSite: Tfr_EditSave
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 1054
        Height = 20
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1054
        inherited p_edit: TPanel
          Width = 1054
          ExplicitWidth = 1054
          inherited btn_save: TSpeedButton
            Left = 1034
            ExplicitLeft = 576
          end
          inherited btn_open: TSpeedButton
            Left = 1014
            ExplicitLeft = 556
          end
          inherited p_text: TPanel
            Width = 967
            ExplicitWidth = 967
            inherited e_text: TEdit
              Width = 960
              ExplicitWidth = 960
            end
          end
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 40
    object mi_oos: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      object mi_OpenList: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1072#1081#1090#1086#1074
        OnClick = mi_OpenListClick
      end
      object mi_ClearURL: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1072#1081#1090#1086#1074
        OnClick = mi_ClearURLClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mi_Exit: TMenuItem
        Caption = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        OnClick = mi_ExitClick
      end
    end
  end
end
