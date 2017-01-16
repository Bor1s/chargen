module CharacterSheetsHelper
  def create_character_sheet_url
    if user_signed_in?
      character_sheets_path
    else
      export_character_sheets_path(@character_sheet)
    end
  end
end
