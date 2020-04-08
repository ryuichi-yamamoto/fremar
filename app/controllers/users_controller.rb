class UsersController < ApplicationController

  def index
    @address = Address.where(user_id: current_user.id).first
  end

  def show
    @user = User.find(params[:id])

#     @address = Address.find(params[:id])
    @address = Address.where(user_id: current_user.id).first
  end

  def new
    @users = User.new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.where(user_id: current_user.id).first
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
      sign_in(current_user, bypass: true)
    else
      redirect_to users_path
    end
  end
  
  def destroy
  end

  def done
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_hiragana, :last_name_hiragana, :birth_year, :birth_month, :birth_day, :email, :password, :password_confirmation, :status, :deleted_at)
  end

end

