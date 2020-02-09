class ProducersController < ApplicationController
  def index

  end

  def show

  end

  def shops

  end

  def products
   @shops = current_producer.shops
  end

  def edit
  end




end
