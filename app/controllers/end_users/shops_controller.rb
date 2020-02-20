class EndUsers::ShopsController < ApplicationController
  def index
  	@shops = Shop.all
  end

  def show
  	@shop = Shop.find(params[:id])
  	gon.shop = @shop.latitude
  	gon.shops = @shop.longitude
  end


 def shop_params
  	  params.require(:shop).permit(:shop_name, :shop_text, :postcode, :prefecture_code, :address_city, :address_street, :adderss_building, :open, :close, :station, :minutes_on_foot, :minutes_on_car, :shop_image, :regular_holiday, :phone_number, :status)
  end
end
