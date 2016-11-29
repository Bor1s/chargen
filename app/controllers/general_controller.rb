class GeneralController < ApplicationController
  def index
  end

  def export_to_pdf
    # NOTE potential problem, any user can access
    # any character sheet!
    # TODO create some sort of protection
    character_sheet = CharacterSheet.find(params[:id])
    service = CharacterSheetService.new(character_sheet)

    if service.export_to_pdf
      send_file service.pdf_path, type: 'application/pdf', disposition: 'inline'
    else
      # TODO
      # render text: service.error
    end

  end
end
