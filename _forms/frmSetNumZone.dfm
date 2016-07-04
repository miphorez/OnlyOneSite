object frm_SetNumZone: Tfrm_SetNumZone
  Left = 515
  Top = 372
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 111
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    000001002000000000004004000000000000000000000000000000000000999F
    93FF704033FF704033FF704134FF704235FF704235FF704134FF704235FF7042
    35FF704134FF6F4033FF767C70FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00767C
    6FFFFFB7B6FF767C70FFCCFFFFFFCCFFFFFFCCFFFFFFCCFFFFFFCCFFFFFFCCFF
    FFFFCCFFFFFFCCFFFFFF704033FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00757B
    6FFFFFFFFFFF767D71FFCCFFFFFF820404FF820404FF820404FFCCFFFFFFCCFF
    FFFFCCFFFFFFCCFFFFFF704033FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00767B
    6FFFFFB6B5FF767B6FFFCCFFFFFFCEFFFFFFD0FFFFFFD3FFFFFFD9FFFFFF0063
    7DFF00637DFF00637DFFFFB7B6FFFFFFFF000093B8000093B80000637D00767B
    6FFFFFFFFFFF767D71FFCCFFFFFFD3FFFFFF00637DFF00637DFFD3FFFFFF0063
    7DFF00D5FFFF00637DFFFFB7B6FF00637DFF00637DFF0093B80000637D00767B
    6FFFFFB6B5FF767B6FFFCCFFFFFF00637DFF0093B8FF017C9CFF00637DFF017C
    9CFF00D5FFFF017C9CFF00637DFF017C9CFF0093B8FF00637DFF00637D00767B
    6FFFFFFFFFFF767D71FFCCFFFFFF00637DFF017C9CFF00D5FFFF56C3E5FF00D5
    FFFF00D5FFFF00D5FFFF56C3E5FF00D5FFFF017C9CFF00637DFF00637D00767B
    6FFFFFB6B5FF767D71FFCCFFFFFFCEFFFFFF00637DFF56C3E5FF56C3E5FF0063
    7DFF00637DFF00637DFF56C3E5FF56C3E5FF00637DFF00D5FF0000D5FF00767B
    6FFFFFFFFFFFFFB6B5FF00637DFF00637DFF017C9CFF00D5FFFF00637DFFFFB6
    B5FFCDFFFFFFCDFFFFFF00637DFF00D5FFFF017C9CFF00637DFF00637DFF767B
    6FFFFFB6B5FFFFB6B5FF00637DFF00D5FFFF00D5FFFF00D5FFFF00637DFFFFB6
    B5FFCDFFFFFFCDFFFFFF00637DFF00D5FFFF00D5FFFF00D5FFFF00637DFF767C
    70FF757B6FFFFFB6B5FF00637DFF00637DFF017C9CFF00D5FFFF00637DFFFFB6
    B5FFFFB6B5FFFFB6B5FF00637DFF00D5FFFF017C9CFF00637DFF00637DFF757B
    6FFFFFB7B6FFFFB6B5FFFFB7B6FFFFB7B6FF00637DFF56C3E5FF56C3E5FF0063
    7DFF00637DFF00637DFF56C3E5FF56C3E5FF00637DFF0093B80000637D00989E
    92FF757B6FFF757B6FFF989E92FF00637DFF017C9CFF00D5FFFF56C3E5FF00D5
    FFFF00D5FFFF00D5FFFF56C3E5FF00D5FFFF017C9CFF00637DFF00637D00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF0000637DFF0093B8FF017C9CFF00637DFF017C
    9CFF00D5FFFF017C9CFF00637DFF017C9CFF0093B8FF00637DFF00637D00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000637DFF00637DFF00637D000063
    7DFF00D5FFFF00637DFF00637D0000637DFF00637DFF00637D00FFFFFF00FFFF
    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000063
    7DFF00637DFF00637DFF00637D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000F
    FFFF000FFFFF000FFFFF000FFFFF0003FFFF0001FFFF0001FFFF0003FFFF0000
    FFFF0000FFFF0000FFFF0003FFFF0001FFFFF001FFFFF913FFFFFF1FFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label_StaticText: TLabel
    Left = 49
    Top = 4
    Width = 193
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Panel_Adr: TPanel
    Left = 4
    Top = 43
    Width = 294
    Height = 25
    BevelInner = bvLowered
    TabOrder = 0
    object Label_CbSel: TLabel
      Left = 2
      Top = 2
      Width = 0
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1058#1077#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox_Zones: TComboBox
      Left = 64
      Top = 2
      Width = 228
      Height = 21
      Align = alRight
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox_ZonesChange
    end
    object Panel1: TPanel
      Left = 59
      Top = 2
      Width = 5
      Height = 21
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object p_Text: TPanel
      Left = 2
      Top = 2
      Width = 57
      Height = 21
      Align = alClient
      Alignment = taRightJustify
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 108
    Width = 300
    Height = 3
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 82
    Width = 300
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 5
      Height = 26
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 295
      Top = 0
      Width = 5
      Height = 26
      Align = alRight
      Alignment = taRightJustify
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 153
      Top = 0
      Width = 142
      Height = 26
      Align = alRight
      Alignment = taRightJustify
      BevelInner = bvLowered
      TabOrder = 2
      object btn_Exit: TButton
        Left = 2
        Top = 2
        Width = 138
        Height = 22
        Align = alClient
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 5
      Top = 0
      Width = 142
      Height = 26
      Align = alLeft
      Alignment = taRightJustify
      BevelInner = bvLowered
      TabOrder = 3
      object btn_OK: TButton
        Left = 2
        Top = 2
        Width = 138
        Height = 22
        Align = alClient
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 0
        OnClick = btn_OKClick
      end
    end
  end
end
