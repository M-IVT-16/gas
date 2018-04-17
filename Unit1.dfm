object Form1: TForm1
  Left = 128
  Top = 122
  Width = 700
  Height = 240
  Caption = #208#224#241#247#184#242' '#242#229#247#229#237#232#255' '#227#224#231#224' '#226' '#242#240#243#225#229
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 56
    Width = 621
    Height = 54
    Caption = #208#224#241#247#184#242' '#242#229#247#229#237#232#255' '#227#224#231#224' '#226' '#242#240#243#225#229
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -48
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 152
    object N1: TMenuItem
      Caption = #207#238#228#227#238#242#238#226#234#224' '#228#224#237#237#251#245
      object N2: TMenuItem
        Caption = #194#226#238#228' '#228#224#237#237#251#245
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #207#240#238#241#236#238#242#240' '#232' '#234#238#240#240#229#234#242#232#240#238#226#234#224' '#235#224#237#237#251#245
        OnClick = N3Click
      end
      object N7: TMenuItem
        Caption = #194#251#245#238#228
        OnClick = N7Click
      end
    end
    object N4: TMenuItem
      Caption = #208#224#241#247#229#242' '#232' '#240#229#231#243#235#252#242#224#242#251' '#240#224#241#247#229#242#224
      object N5: TMenuItem
        Caption = #208#224#241#247#229#242
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #208#229#231#243#235#252#242#224#242#251
        OnClick = N6Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 152
  end
end
