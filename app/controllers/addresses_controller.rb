class AddressesController < ApplicationController

  def new
  end

  def edit
    @addresses = Addresse.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
      sign_in(current_user, bypass: true)
    else
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_hiragana, :last_name_hiragana, :birth_year, :birth_month, :birth_day, :email, :password, :password_confirmation, :status, :deleted_at)
  end

end
