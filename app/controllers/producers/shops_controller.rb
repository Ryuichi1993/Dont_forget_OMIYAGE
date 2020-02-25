class Producers::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @shops_name = @shops.name
    @producer = current_producer
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
  	@shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
  	@shop = Shop.new(shop_params)
  	@shop.producer_id = current_producer.id
  	if @shop.save
  		flash[:notice] = "保存に成功しました"
  		redirect_to producers_shops_path
  	else
  		render :new
  	end
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to producers_shops_path
    else
      @shop = Shop.find(params[:id])
      render :show
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "更新に成功しました"
      redirect_to producers_shops_path
    else
      @shop = Shop.find(params[:id])
      render :edit
    end
  end



  private
  def shop_params
  	  params.require(:shop).permit(:shop_name, :shop_text, :postcode, :prefecture_code, :address_city, :address_street, :adderss_building, :open, :close, :station, :minutes_on_foot, :minutes_on_car, :shop_image, :regular_holiday, :phone_number, :status)
  end

end