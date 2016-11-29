class CharacterSheetService

  NoTemplateError = Class.new(StandardError)

  attr_reader :pdf_path, :character_sheet

  def initialize(character_sheet)
    @character_sheet = character_sheet
    @game_system     = character_sheet.class.name.demodulize
    @base_path       = Rails.root
    @template_path   = @base_path.join('tmp', 'pdf_templates', "ORIGINAL-#{@game_system}-Character-Sheet.pdf")
    check_if_pdf_template_exist!

    @pdf_path        = generate_character_sheet_pdf_name
    @pdftk           = PdfForms.new(ENV['PDFTK_PATH'], data_format: 'XFdf', utf8_fields: true)
  end

  def export_to_pdf!
    fields_hash = fetch_character_sheet_fields_data
    fill_pdf_form(fields_hash)
  end

  private

  def fetch_character_sheet_fields_data
    data = character_sheet.class.stored_attributes[:data_fields].map do |human_field_name|
      [character_sheet.class::FIELDS_MAP.first[human_field_name], character_sheet.data_fields[human_field_name]]
    end

    Hash[data]
  end

  def generate_character_sheet_pdf_name
    @base_path.join('tmp', 'downloads', "#{@game_system}_#{SecureRandom.hex(8)}.pdf")
  end

  def fill_pdf_form(data)
    @pdftk.fill_form @template_path, pdf_path, data
  end

  def check_if_pdf_template_exist!
    raise NoTemplateError, "no template found here #{@template_path}" unless File.exist?(@template_path)
  end
end
