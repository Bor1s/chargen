class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!, except: [:export, :fate, :hero_quest, :fae, :gurps]

  # New Fate
  def fate
    if user_signed_in?
      @character_sheet = current_user.fate_core_character_sheets.build
    else
      @character_sheet = CharacterSheets::FateCore.new
    end
  end

  # New Hero Quest
  def hero_quest
    if user_signed_in?
      @character_sheet = current_user.hero_quest_character_sheets.build
    else
      @character_sheet = CharacterSheets::HeroQuest.new
    end
  end

  # New Fate Accelerated
  def fae
    if user_signed_in?
      @character_sheet = current_user.fate_accelerated_character_sheets.build
    else
      @character_sheet = CharacterSheets::FateAccelerated.new
    end
  end

  # New GURPS
  def gurps
    if user_signed_in?
      @character_sheet = current_user.gurps_character_sheets.build
    else
      @character_sheet = CharacterSheets::Gurps.new
    end
  end

  def create
    service = CreateCharacterSheetService.new(current_user, system, character_sheet_params)

    if service.save
      service.generate_shareable_link
      redirect_to edit_character_sheet_path(service.character_sheet), notice: t('.character_sheet_created')
    else
      @character_sheet = service.character_sheet
      render system
    end
  end

  def show
    @character_sheet = current_user.character_sheets.find(params[:id])
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
    service = CharacterSheetExportService.new(extract_character_sheet)
    if service.export
      send_file service.output_pdf, type: 'application/pdf', disposition: 'inline'
    else
      render 'export_failed'
    end
  end

  private

  def character_sheet_params
    params.require(:character_sheet).permit!
  end

  def system
    params.require(:system)
  end

  def extract_character_sheet
    if user_signed_in?
      current_user.character_sheets.find(params[:id])
    else
      CharacterSheetFactory.build(system, character_sheet_params)
    end
  end
end
