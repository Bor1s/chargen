class PdfMetaService
  attr_reader :template_path, :fields_path, :output_pdf

  def initialize(character_sheet)
    system         = character_sheet.class::SYSTEM_NAME
    name           = "#{system}_#{SecureRandom.hex(8)}"
    @template_path = Rails.root.join('tmp', 'pdf_templates', "#{system}.pdf")
    @fields_path   = Rails.root.join('tmp', 'downloads', "#{name}_fields.txt")
    @output_pdf    = Rails.root.join('tmp', 'downloads', "#{name}.pdf")
  end
end
