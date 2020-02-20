class EndUsers::ReservationsController < ApplicationController
  before_action :authenticate_end_user!
  def index
  	@reservations = Reservation.all
  	current_end_user.reservations.each do |r|
  		@resevation = r
  	end
  end

  def show
  end

  def new
    @memory = current_end_user.memories
    if @memory.blank?
        flash[:notice] = "予約をしてください"
        redirect_to public_product_categories_path
    end
    @reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(reservation_params)
    current_end_user.memories.each do |m|
    @reservation.end_user_id = current_end_user.id
    @reservation.product_id = m.product_id
    if @reservation.save!
    	current_end_user.memories.destroy_all
    	redirect_to thank_end_users_reservations_path
    else
    	render :new
    end
    end
  end


  private
  def reservation_params
  	params.require(:reservation).permit(:end_user_id, :product_id, :start_date, :end_date)
  end

  def correct_end_user
    @book = Book.find(params[:id])
    unless
    @book.user == current_user
      redirect_to books_path
    end
end
end


