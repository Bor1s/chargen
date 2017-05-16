class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound,
              ActionController::MissingFile,
              with: :not_found

  rescue_from ActionController::ParameterMissing do |e|
    render 'malicious_request'
  end

  private

  def not_found
    render 'not_found'
  end
end
