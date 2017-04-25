class CharacterSheetExportService
  attr_reader :output_pdf
  attr_writer :exporter, :extractor

  def initialize(character_sheet)
    @character_sheet = character_sheet
  end

  def extractor
    @extractor ||= DataExtractorService.new(@character_sheet)
  end

  def exporter
    @exporter ||= PdfExporterService.new(extractor.extract, @character_sheet)
  end

  def export
    exported = exporter.export
    @output_pdf = exporter.pdf_meta.output_pdf if exported
    exported
  end
end
