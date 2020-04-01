class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def production?
    Rails.env.production?
  end

  def basic_auth , if: :production?
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end