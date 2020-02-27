class Producers::ProducersController < ApplicationController
  before_action :authenticate_producer!
  def index
  end

  def show
  end

  def edit
  	@producer = Producer.find(params[:id])
  end

  def destroy
    @producer = current_producer
    if @producer.destroy
      redirect_to new_admin_registration
    else
      :withdraw
    end
  end

  def shops

  end

  def products
    @product = current_producer.products

  end

  def edit

  end

  def search
    @shops = Shop.where(shop_name: params[:shop_name])
    @product = Product.where(shop_id: @shops.pluck(:id))
    render :products
  end

end
