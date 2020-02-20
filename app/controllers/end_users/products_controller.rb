class EndUsers::ProductsController < ApplicationController

  def index
  @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
    impressionist(@product,nil)
    @product.impressions.last.update(user_id: current_end_user.id)
  	@comment = ProductComment.new
    @memory = Memory.new

  end

  def search
  @shop = Shop.where(prefecture_code: params[:pref])
  @product = Product.where(shop_id: @shop.pluck(:id))
  render :index
  end
end
