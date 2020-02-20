class EndUsers::CategoriesController < ApplicationController
  def index
  end

  def show
  	@product_category = ProductCategory.find(params[:id])
  	@category = Category.find(params[:id])
  end
end
