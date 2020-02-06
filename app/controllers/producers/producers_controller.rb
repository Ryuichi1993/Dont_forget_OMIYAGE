class Producers::ProducersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  	@producer = Producer.find(params[:id])
  end


end
