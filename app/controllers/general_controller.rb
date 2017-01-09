class GeneralController < ApplicationController

  rescue_from CharacterSheetService::NoTemplateError, with: :no_pdf_template

  def index
  end

  private

  # TODO create nice page to show to user
  def no_pdf_template
    render text: 'No PDF template found'
  end
end
