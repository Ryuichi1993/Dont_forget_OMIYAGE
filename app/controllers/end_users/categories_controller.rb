class EndUsers::CategoriesController < ApplicationController
  before_action :authenticate_end_user!
  def index
  end

  def show
  	@product_category = ProductCategory.find(params[:id])
  	@categories = Category.find(params[:id])
  	@category = @categories.products.page(params[:page]).reverse_order
  end

  def search_product
  	@shop = Category.where(category_id: params[:id])
  	@product = Product.where(category_id: @shop.pluck(:id))
  	@categories = ProductCategory.where(product_id: @product.pluck(:id))
  	@category = @categories.page(params[:page]).reverse_order
  	binding.pry
  	render :show
  end

end
