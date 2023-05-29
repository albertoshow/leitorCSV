object FrameBase: TFrameBase
  Left = 0
  Top = 0
  Width = 160
  Height = 40
  TabOrder = 0
  object pnlBtnFundo: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 40
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 400
    ExplicitTop = 80
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlImg: TPanel
      Left = 0
      Top = 0
      Width = 40
      Height = 40
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        Align = alClient
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object Panel3: TPanel
      Left = 40
      Top = 0
      Width = 120
      Height = 40
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 104
      ExplicitTop = 24
      ExplicitWidth = 185
      ExplicitHeight = 41
      object lblTitulo: TLabel
        Left = 0
        Top = 0
        Width = 120
        Height = 40
        Align = alClient
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Label Base'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 77
        ExplicitHeight = 21
      end
    end
  end
end
