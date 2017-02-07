class ShareableLinksController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    respond_to do |format|
      format.js do
        @character_sheet = current_user.character_sheets.find(params[:character_sheet_id])
        @character_sheet.shareable_link = ShareableLink.new(token: SecureRandom.hex(8))
      end
    end
  end

  def show
    link = ShareableLink.find_by_token!(token_params)
    @character_sheet = link.character_sheet
  end

  def destroy
    respond_to do |format|
      format.js do
        @character_sheet = current_user.character_sheets.find(params[:character_sheet_id])
        @character_sheet.shareable_link.destroy
      end
    end
  end

  private

  def token_params
    params.require(:token)
  end
end
