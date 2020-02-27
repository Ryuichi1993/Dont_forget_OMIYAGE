class EndUsers::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_end_user,   only: [:edit, :update, :destroy]
  def index
  end

  def show
    @category = Category.all
    @ranking = Product.ranking
    @view = Product.view

  end

  def ranking
    @ranking_view = Product.ranking_view
  end

  def iine_ranking
    @ranking = Product.ranking
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
    if @end_user.save
      NotificationMailer.send_confirm_to_user(@end_user).deliver
      redirect_to @end_user
    else
      render 'new'
    end
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
    params.require(:end_user).permit(:name, :introduction, :profile_image, :deleted_at)
  end

  def correct_end_user
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
    redirect_to end_users_end_user_path(current_user.id)
    end
  end
end
