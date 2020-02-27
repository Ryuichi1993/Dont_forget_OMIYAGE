class EndUsers::ProductCategoriesController < ApplicationController
  before_action :authenticate_end_user!
  def show
  	@product_category = ProductCategory.find(params[:id])

end
end
