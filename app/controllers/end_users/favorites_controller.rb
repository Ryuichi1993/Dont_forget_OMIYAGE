class EndUsers::FavoritesController < ApplicationController
before_action :authenticate_end_user!

  def create
	  @product = Product.find(params[:product_id])
	  @favorite = current_end_user.favorites.new(product_id: @product.id)
	  @favorite.save
  end


  def destroy
	  @product = Product.find(params[:product_id])
	  @favorite = current_end_user.favorites.find_by(product_id: @product.id)
	  @favorite.destroy
  end

  def index
  	@product = Product.find(params[:id])
  end

 private
 def product_params
 	require.(:product).permit(:product_id, :product_image, :product_name)
 end

end
