class EndUsers::ShopsController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @shops = Shop.page(params[:page]).reverse_order
  end

  def show
  	@shop = Shop.find(params[:id])
  	gon.shop = @shop.latitude
  	gon.shops = @shop.longitude
  end

  def search_shop
  @shop = Shop.where(prefecture_code: params[:pref])
  @shops = @shop.page(params[:page]).reverse_order

  render :index
  end


 def shop_params
  	  params.require(:shop).permit(:shop_name, :shop_text, :postcode, :prefecture_code, :address_city, :address_street, :adderss_building, :open, :close, :station, :minutes_on_foot, :minutes_on_car, :shop_image, :regular_holiday, :phone_number, :status)
  end
end
