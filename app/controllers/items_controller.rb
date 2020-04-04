class ItemsController < ApplicationController
  
require 'payjp'
 
  def index
    @items = Item.includes(:images).order('created_at DESC')
    #TOPページ新規商品一覧表示ーーーーーーーーーーーーーーーーーー
    #@items = Item.all.limit(3).order(:created_at)
    #@images = Image.where('item_id == ?',@items.ids)
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["カテゴリ選択"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end  
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item 
    else
      redirect_to action: :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :price, :text, :size, :prefecture, :category_id, :status, :deliveryfee, :deliveryday, :condition, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
end
