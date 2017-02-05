class ShareableLinksController < ApplicationController
  def show
    link = ShareableLink.find_by_token(params[:token])
    @character_sheet = link.character_sheet
  end
end
