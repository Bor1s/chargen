class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!, except: [:export, :fate, :hero_quest]

  def index
  end

  def fate
    if user_signed_in?
      @character_sheet = current_user.fate_core_character_sheets.build
    else
      @character_sheet = CharacterSheets::FateCore.new
    end
  end

  def hero_quest
    if user_signed_in?
      @character_sheet = current_user.hero_quest_character_sheets.build
    else
      @character_sheet = CharacterSheets::HeroQuest.new
    end
  end

  def create
    @character_sheet = CharacterSheetFactory.build(system_params, character_sheet_params)
    @character_sheet.user = current_user

    if @character_sheet.save
      flash.notice = 'Character sheet created'
      redirect_to edit_character_sheet_path(@character_sheet)
    else
      render system_params
    end
  end

  def edit
    @character_sheet = current_user.character_sheets.find(params[:id])
  end

  def update
    @character_sheet = current_user.character_sheets.find(params[:id])
    if @character_sheet.update_attributes(character_sheet_params)
      flash.notice = t('flashes.character_sheets.updated')
      redirect_to edit_character_sheet_path(@character_sheet)
    else
      render :edit
    end
  end

  def destroy
    @character_sheet = current_user.character_sheets.find(params[:id])
    if @character_sheet.destroy
      flash.notice = t('flashes.character_sheets.deleted')
    else
      flash.alert = t('flashes.character_sheets.not_deleted')
    end

    redirect_to character_sheets_profile_path
  end

  def export
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

  def export_saved_sheet
    character_sheet = current_user.character_sheets.find(params[:id])
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
