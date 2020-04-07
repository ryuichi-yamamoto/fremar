class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
    else
      redirect_to action: :new
    end
  end

  def edit
    @address = Address.find(params[:id])
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

  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_hiragana, :last_name_hiragana, :postal_code, :prefecture, :city, :address, :address, :room, :tel, :user_id).merge(user_id: current_user.id)
  end

end
