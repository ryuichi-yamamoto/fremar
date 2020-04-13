class Users::RegistrationsController < Devise::RegistrationsController

  # マイページにて住所が登録されているか否かの条件分岐を有効にするための記述です
  before_action :set_address, only: :edit

  # SNS認証に関する記述です
  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  private

  def set_address
    @address = Address.where(user_id: current_user.id).first
  end
  
end
