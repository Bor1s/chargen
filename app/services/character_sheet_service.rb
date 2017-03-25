class CharacterSheetService
  NoTemplateError = Class.new(StandardError)

  attr_reader :pdf_path, :character_sheet

  def initialize(character_sheet)
    @character_sheet = character_sheet
    @game_system     = character_sheet.class::SYSTEM_NAME
    @base_path       = Rails.root
    @template_path   = @base_path.join('tmp', 'pdf_templates', "#{@game_system}.pdf")
    check_if_pdf_template_exist!

    @pdf_path        = generate_character_sheet_pdf_name
    @pdf_tmp_fields_path = generate_character_sheet_pdf_tmp_fields_name(pdf_path)
  end

  def export_to_pdf!
    save_character_sheet_fields_data
    fill_pdf_form
  end

  private

  def save_character_sheet_fields_data
    data = character_sheet.class.stored_attributes[:data_fields].map do |field_name|
      original_field_name = character_sheet.class.fields_map[field_name] # Field name as defined in character sheet
      field_value = escape_unsafe(character_sheet.data_fields[field_name].to_s)
      "#{original_field_name} #{field_value}"
    end

    f = File.open(@pdf_tmp_fields_path, 'w')
    data.each do |line|
      f.puts line
    end
    f.close
  end

  def escape_unsafe(string)
    # TODO convert true/false to 'Yes'/'Off'
    string&.gsub!(/\\/, '\\\\\\')
    string&.gsub!(/(\r\n)|(\r)/, '\n')
    string
  end

  def generate_character_sheet_pdf_name
    @base_path.join('tmp', 'downloads', "#{@game_system}_#{SecureRandom.hex(8)}.pdf")
  end

  def generate_character_sheet_pdf_tmp_fields_name(parent_path_path)
    @base_path.join('tmp', 'downloads', "#{parent_path_path}_fields.txt")
  end

  def fill_pdf_form
    SafeShell.execute("java -jar #{ENV['PDFFILLER_PATH']} #{@template_path} -f #{@pdf_tmp_fields_path} -font #{ENV['PDF_FONT_PATH']} -flatten #{@pdf_path}")
  end

  def check_if_pdf_template_exist!
    raise NoTemplateError, "no template found here #{@template_path}" unless File.exist?(@template_path)
  end
end
