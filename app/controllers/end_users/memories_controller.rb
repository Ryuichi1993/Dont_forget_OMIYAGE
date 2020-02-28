class EndUsers::MemoriesController < ApplicationController
	before_action :authenticate_end_user!
  def index
  	@end_user = current_end_user
  	@memories = @end_user.memories
  end

  def show
  end

  def create
 	@memory = current_end_user.memories.new(memory_params)
	if @memory.save!
	redirect_to end_users_memories_path
	else
		render :show
	end
  end

  def update
	@memory = Memory.find(params[:id])
	if @memory.update(memory_params)
	   redirect_to end_users_memories_path(@memory)
	else
		render :index
	end
  end

  def destroy
	@memory = Memory.find(params[:id])
	if @memory.destroy
		redirect_to end_users_memories_path
	else
		render :index
	end
  end

  def destroy_all
	@end_user = current_end_user
	@memory = @end_user.cart_items
	if @memory.destroy_all
	   redirect_to public_cart_items_path
	else
		render :index
	end
  end

  private
  def memory_params
  	params.require(:memory).permit(:end_user_id, :product_id, :start_date, :end_date)
  end

end

