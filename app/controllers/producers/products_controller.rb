class Producers::ProductsController < ApplicationController
  def index
    @product = current_producer.products.all
    @shop = current_producer.shops.all
  end

  def ichiran
    @product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  	@shop = current_producer.shops
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
  		redirect_to producers_products_path
  	else
  		render :new
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	if @product.destroy
  		flash[:notice] = "削除に成功しました"
  		redirect_to producers_products_path
  	else
  		render :show
  	end
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		flash[:notice] = "編集に成功しました"
  		redirect_to producers_products_path
  	else
  		render :edit
  	end
  end


  private
  def product_params
  	params.require(:product).permit( :product_name, :product_text, :product_price,
     :product_image, :shop_id, :producer_id, category_ids:[])
  end

end
