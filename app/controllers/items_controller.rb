class ItemsController < ApplicationController

# before_action :set_item, except: [:index, :new, :create]


  def index
      @items = Item.includes(:images).references(:items).where(condition: '1').limit(3).order('created_at DESC')
      @ladies_items = Item.includes(:images).references(:items).where(condition: '1', category_id: 1..199).limit(3).order('created_at DESC')
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
    @product.destroy
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
    params.require(:item).permit(:name, :price, :text, :size, :prefecture, :category_id, :status, :deliveryfee, :deliveryday, :condition, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
