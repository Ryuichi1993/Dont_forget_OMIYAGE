class Producers::ProductsController < ApplicationController
	before_action :set_shops, only: [:new, :create]
  def index
  	@producer = current_producer
  	@producer.shops.each do |pr|
  		@shop = pr
  	end
  end

  def show
  end

  def edit
  	@product = Product.find(params[:id])
  	@shop = current_producer.shops
  	@shops = Shop.find(params[:id])
  end

  def new
  	@product = Product.new
  	@producer = current_producer
  	@shop = @producer.shops
  end

  def create
  	@product = Product.new(product_params)
  	@producer = current_producer
  	@shop = @producer.shops
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

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		flash[:notice] = "編集に成功しました"
  		redirect_to producers_products_path(current_producer)
  	else
  		render :edit
  	end
  end

  private
  def product_params
  	params.require(:product).permit(:product_name, :product_text, :product_price, :product_image, :shop_id, :producer_id)
  end

  def set_shops
  	@shops = Shop.all
  end
end
