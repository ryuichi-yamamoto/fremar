class CategoriesController < ApplicationController
  def show
    if params[:id]
      @category = Category.find(params[:id])
      @posts = @category.posts.order(created_at: :desc).all
    else
      @posts = Post.order(created_at: :desc).all
    end
    @category = Category.where(id:16..56)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material, :category_id, :likes_count)
  end
end
