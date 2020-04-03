class ItemsController < ApplicationController

before_action :set_item, except: [:index, :new, :create]


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
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
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
    params.require(:item).permit(:name, :price, :text, :size, :prefecture, :category_id, :status, :deliveryfee, :deliveryday, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
