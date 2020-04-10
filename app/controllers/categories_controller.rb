class CategoriesController < ApplicationController
  
  def index
    
  end

  def show
    @category = Category.find(params[:id])
    @categories = [
      # 下記で@categoryを取得
      @category,
      # 下記で@categoryの子カテゴリーを全て取得
      @category.children,
      # 下記で@categoryの子カテゴリーの子カテゴリーを全て取得
      @category.children.map { |category| category.children }
    ].flatten.compact
    @items = Item.includes(:images).references(:items).where(condition: '1',category_id: params[:id]).order('created_at DESC')
    
  end

end


