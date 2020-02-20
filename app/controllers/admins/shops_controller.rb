class Admins::ShopsController < ApplicationController
  def index
  	@producers = Producer.with_deleted
  	@producers.each do |p|
  	@producer = p
    end
  	@shop = @producer.shops
  end

  def show
  	@shop = Shop.find(params[:id])
  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
  	@shop = Shop.find(params[:id])
  	if @shop.update(shop_params)
  		redirect_to admins_shop_path(@shop)
  	else
  		render :edit
 	end
  end

  def destroy
  	@shop = Shop.find(params[:id])
  	if @shop.destroy
  		redirect_to admins_shops_path
  	else
  		render :show
  	end
  end

 private
  def shop_params
  	  params.require(:shop).permit(:shop_name, :shop_text, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :open, :close, :station, :minutes_on_foot, :minutes_on_car, :shop_image, :regular_holiday, :phone_number, :status)
  end
end
