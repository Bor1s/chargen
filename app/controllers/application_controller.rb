class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound,
              ActionController::MissingFile,
              with: :not_found

  private

  def not_found
    render 'not_found'
  end
end
