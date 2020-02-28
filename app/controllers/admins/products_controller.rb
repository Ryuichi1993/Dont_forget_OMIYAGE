class Admins::ProductsController < ApplicationController
  def index
  	@shops = Shop.all
  	@shops.each do |s|
  	@shop = s
    @product = s.products
    end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def product_show
    @shop = Shop.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
       redirect_to admins_shops_path
    else
    	render :edit
    end
  end

  def destroy
  	@product = Product.find(params[:id])
  	if @product.destroy
  		redirect_to admins_shops_path
  	else
  		render :show
  	end
  end

  private
  def product_params
  	params.require(:product).permit(:product_name, :product_text, :product_iamge, :product_price)
  end
end
