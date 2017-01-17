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
end
