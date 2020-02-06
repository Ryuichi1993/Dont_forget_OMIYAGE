class Producers::ProductsController < ApplicationController
	before_action :set_shops, only: [:new, :create]
  def index
  end

  def show
  	@producer = current_producer
  	@producer.shops.each do |pr|
  		@shop = pr
  	end
  end

  def edit
  end

  def new
  	@product = Product.new
  	@producer = current_producer
  end

  def create
  	@product = Product.new(product_params)
  	@producer = current_producer
  	@shop = @producer.shops

  	puts @product.to_json

  	if @product.save
  		flash[:notice] = "保存に成功しました"
  		redirect_to producers_producers_path
  	else
  		render :new
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	if @product.destroy
  		flash[:notice] = "削除に成功しました"
  		redirect_to producers_producers_path
  	else
  		render :show
  	end
  end

  private
  def product_params
  	params.require(:product).permit(:product_name, :product_text, :product_price, :product_image, :shop_id)
  end

  def set_shops
  	@shops = Shop.all
  end
end
