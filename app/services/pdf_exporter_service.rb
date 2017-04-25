class PdfExporterService
  attr_reader :pdf_meta

  def initialize(data, character_sheet)
    @character_sheet = character_sheet
    @data            = data
    @pdf_meta        = PdfMetaService.new(character_sheet)
  end

  def export
    fill_fields_file
    fill_pdf
  end

  private

  def fill_fields_file
    f = File.open(pdf_meta.fields_path, 'w')
    @data.each { |line| f.puts(line) }
    f.close
  end

  def fill_pdf
    SafeShell.execute?("java -jar #{ENV['PDFFILLER_PATH']} #{pdf_meta.template_path} -f #{pdf_meta.fields_path} -font #{ENV['PDF_FONT_PATH']} -flatten #{pdf_meta.output_pdf}")
  end
end
