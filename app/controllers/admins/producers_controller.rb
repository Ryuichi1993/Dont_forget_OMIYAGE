class Admins::ProducersController < ApplicationController
  def index
  	@producer = Producer.with_deleted
  end

  def show
  	@producer = Producer.with_deleted.find(params[:id])
  end

  def edit
  end

  private
  def producer_params
      pramas.require(:proudcer).permit(:name, :deleted_at)
  end
end

