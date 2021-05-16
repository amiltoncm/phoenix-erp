inherited frmRelComissoes: TfrmRelComissoes
  Caption = 'Relat'#243'rio de Comiss'#245'e (Vendedores)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Relatorio: TppReport
    PrinterSetup.DocumentName = 'Relatorio de Comiss'#245'es (Vendedores)'
    DataPipelineName = 'dbDados'
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppLinha1: TppLine
        LayerName = Foreground
      end
      inherited ppLinha2: TppLine
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      inherited ppLinha3: TppLine
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers [4]
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
  end
end
