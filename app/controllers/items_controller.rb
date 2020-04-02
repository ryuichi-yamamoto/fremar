class ItemsController < ApplicationController

  def index
    @items = Item.limit(3).order(:created_time)
    
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  def purchase
  end

  def pay
    Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
    Payjp::Charge.create(
    amount: 1200,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to action: :done
  end

  def done
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :size, :prefecture, :status, :deliveryfee, :deliveryday).merge(user_id: current_user.id)
  end

  
end
