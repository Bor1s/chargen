class CharacterSheetsController < ApplicationController

  def index
  end

  def fate
    @character_sheet = CharacterSheets::FateCore.new
  end

  def create
    @character_sheet = CharacterSheetFactory.build(system_params, character_sheet_params)

    if @character_sheet.save
      redirect_to edit_character_sheet_path(@character_sheet)
    else
      render system_params
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def export
    # NOTE potential problem, any user can access
    # any character sheet!
    # TODO create some sort of protection
    character_sheet = CharacterSheet.find(params[:id])
    service = CharacterSheetService.new(character_sheet)
    service.export_to_pdf!
    send_file service.pdf_path, type: 'application/pdf', disposition: 'inline'
  end

  private

  def character_sheet_params
    params.require(:character_sheet).permit!
  end

  def system_params
    params.require(:system)
  end
end
