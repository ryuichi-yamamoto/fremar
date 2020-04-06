class ItemsController < ApplicationController
  
  
require 'payjp'
 
  def index
      @items = Item.includes(:images).references(:items).where(condition: '1').limit(3).order('created_at DESC')
      @ladies_items = Item.includes(:images).references(:items).where(condition: '1', category_id: 1..199).limit(3).order('created_at DESC')  
  end

  def show
    @item = Item.find(params[:id])
    @item_images = @item.images
    @item_image = Image.new
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
  end

  def purchase
    @item = Item.find(params[:id])
    @item_images = @item.images
    @item_image = Image.new
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      # redirect_to controller: "cards", action: "confirmation"
    else
      Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand 
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def pay
    @item = Item.find(params[:id])
    @item.increment!(:condition, 1)
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
    redirect_to action: :done
  end

  def done
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :size, :prefecture_id, :category_id, :status_id, :deliveryfee_id, :deliveryday_id, :condition, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
end
