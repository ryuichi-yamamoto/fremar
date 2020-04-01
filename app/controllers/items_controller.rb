class ItemsController < ApplicationController

  def index
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
  end

  def done
  end

end
