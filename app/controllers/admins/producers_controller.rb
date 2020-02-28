class Admins::ProducersController < ApplicationController
  def index
  	@producer = Producer.with_deleted
  end

  def show
  	@producer = Producer.with_deleted.find(params[:id])
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def update
    @producer = Producer.with_deleted.find(params[:id])
    if @producer.update(producer_params)
    case params[:status]
    when "0"
      @producer.restore
      redirect_to admins_producers_path
    when "1"
      @producer.destroy
      redirect_to admins_producers_path
    else
       render :edit
    end
  end
  end

  private
  def producer_params
      params.require(:producer).permit(:name, :deleted_at)
  end
end

