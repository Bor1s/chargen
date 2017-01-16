class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!, except: [:export, :fate]

  def index
  end

  def fate
    if user_signed_in?
      @character_sheet = current_user.fate_core_character_sheets.build
    else
      @character_sheet = CharacterSheets::FateCore.new
    end
  end

  def create
    @character_sheet = CharacterSheetFactory.build(system_params, character_sheet_params)
    @character_sheet.user = current_user

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
    if user_signed_in?
      export_saved_sheet
    else
      export_unsaved_sheet
    end
  end

  private

  def character_sheet_params
    params.require(:character_sheet).permit!
  end

  def system_params
    params.require(:system)
  end

  # TODO 
  def export_saved_sheet
    character_sheet = CharacterSheet.find(params[:id])
    service = CharacterSheetService.new(character_sheet)
    service.export_to_pdf!
    send_file service.pdf_path, type: 'application/pdf', disposition: 'inline'
  end

  def export_unsaved_sheet
    @character_sheet = CharacterSheetFactory.build(system_params, character_sheet_params)
    service = CharacterSheetService.new(@character_sheet)
    service.export_to_pdf!
    send_file service.pdf_path, type: 'application/pdf', disposition: 'inline'
  end
end
