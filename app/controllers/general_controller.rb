class GeneralController < ApplicationController

  rescue_from CharacterSheetService::NoTemplateError, with: :no_pdf_template

  def index
  end

  def export_to_pdf
    # NOTE potential problem, any user can access
    # any character sheet!
    # TODO create some sort of protection
    character_sheet = CharacterSheet.find(params[:id])
    service = CharacterSheetService.new(character_sheet)
    service.export_to_pdf!
    send_file service.pdf_path, type: 'application/pdf', disposition: 'inline'
  end

  private

  # TODO create nice page to show to user
  def no_pdf_template
    render text: 'No PDF template is found'
  end
end
