object frmIniCloner: TfrmIniCloner
  Left = -756
  Top = 68
  Width = 540
  Height = 566
  Caption = 'Clonar INI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 161
    Width = 524
    Height = 367
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Clonar Arquivos'
      object Panel1: TPanel
        Left = 0
        Top = 298
        Width = 516
        Height = 41
        Align = alBottom
        TabOrder = 0
        object pbClonarArquivos: TButton
          Left = 392
          Top = 8
          Width = 99
          Height = 25
          Caption = 'Clonar Arquivos'
          TabOrder = 0
          OnClick = pbClonarArquivosClick
        end
        object pbClones: TProgressBar
          Left = 1
          Top = 36
          Width = 514
          Height = 4
          Align = alBottom
          Step = 1
          TabOrder = 1
        end
      end
      object mmArquivos: TMemo
        Left = 0
        Top = 0
        Width = 516
        Height = 298
        Align = alClient
        Color = clWindowText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clonar Um'
      ImageIndex = 1
      object pbClonarUm: TBitBtn
        Left = 392
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Clonar'
        TabOrder = 0
        OnClick = pbClonarUmClick
      end
      object edDestino: TLabeledEdit
        Left = 8
        Top = 8
        Width = 369
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Destino :'
        TabOrder = 1
        Text = 't:\fabiano\spCfg.ini'
      end
    end
  end
  object IniOrigem: TMemo
    Left = 0
    Top = 0
    Width = 524
    Height = 161
    Align = alTop
    Color = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '[Database]'
      'Alias=pg5isupq'
      'TipoBanco=SQLSERVER'
      'Server=SERVER126\ISAJ01')
    ParentFont = False
    TabOrder = 1
  end
end
