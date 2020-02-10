class EndUsers::ProductsController < ApplicationController
  def index
  	@product = Product.all
    @shop = Shop.all
  end

  def show
  	@product = Product.find(params[:id])
  	@comment = ProductComment.new

  end
end
