module CharacterSheetsHelper
  def create_character_sheet_url
    if user_signed_in?
      character_sheets_path
    else
      export_character_sheets_path(@character_sheet)
    end
  end

  def html_options
    if user_signed_in?
      {}
    else
      { target: '_blank' }
    end
  end

  def show_template_path(object)
    "character_sheets/#{path_resolver(object)}/sheet"
  end

  def form_template_path(object)
    "character_sheets/#{path_resolver(object)}/form"
  end

  private

  def path_resolver(object)
    return 'faes' if object.is_a?(CharacterSheets::FateAccelerated)
    object.class.name.demodulize.underscore.pluralize
  end
end
