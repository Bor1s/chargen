class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def character_sheets
    @character_sheets = current_user.character_sheets
  end
end
