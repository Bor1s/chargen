class DataExtractorService
  def initialize(character_sheet)
    @character_sheet = character_sheet
  end

  def extract
    @character_sheet.class.stored_attributes[:data_fields].map do |field_name|
      field_name_as_defined_in_sheet = @character_sheet.class.fields_map[field_name]
      field_value                    = escape_unsafe(@character_sheet.data_fields[field_name].to_s)
      "#{field_name_as_defined_in_sheet} #{field_value}"
    end
  end

  private

  def escape_unsafe(string)
    # TODO: convert true/false to 'Yes'/'Off'
    string&.gsub!(/\\/, '\\\\\\')
    string&.gsub!(/(\r\n)|(\r)/, '\n')
    string
  end
end
