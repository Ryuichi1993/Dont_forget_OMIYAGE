class EndUsers::EndUsersController < ApplicationController

  def index

  end

  def show
    @product = Product.all
    @place = Shop.new

  end

  def product

  end

  def edit
    @end_user = current_end_user

  end

  def withdraw
    @end_user = current_end_user
  end

  def create

  end

  def destroy
    @end_user = current_end_user
    if @end_user.destroy
      redirect_to top_index_path
    else
      render :withdraw
    end
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
       flash[:notice] = "User was successfully updated."
       redirect_to end_users_end_user_path(current_end_user)
    else
      render :edit
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end
end
