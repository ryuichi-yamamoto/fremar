class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save!
    else
      redirect_to action: :new
    end
  end

  def edit
    @address = Address.where(user_id: current_user.id).first
  end

  def update
    @address = Address.where(user_id: current_user.id).first
    if @address.update(address_params)
      redirect_to users_path(current_user)
    else
      redirect_to action: :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_hiragana, :last_name_hiragana, :postal_code, :prefecture, :city, :address, :address, :room, :tel).merge(user_id: current_user.id)
  end

end
