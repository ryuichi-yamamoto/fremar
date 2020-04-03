class ItemsController < ApplicationController

  require 'payjp'

  def index
    #TOPページ新規商品一覧表示ーーーーーーーーーーーーーーーーーー
    #@items = Item.all.limit(3).order(:created_at)
    #@images = Image.where('item_id == ?',@items.ids)
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  def purchase
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      # redirect_to controller: "cards", action: "confirmation"
    else
      Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
    Payjp::Charge.create(
    amount: 12000,
    customer: card.customer_id,
    currency: 'jpy',
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
