class EndUsers::ProductCommentsController < ApplicationController

def create
	@product = Product.find(params[:product_id])
	@comment = ProductComment.new(product_comment_params)
	@comment.end_user_id = current_end_user.id
	@comment.product_id = @product.id
	if @comment.save
    else
    	@product = Product.find(params[:product_id])
    	@shop = Shop.find(params[:shop_id])

    end

end

def destroy
	@product = Product.find(params[:product_id])
	@comment = current_end_user.product_comments.find_by(product_id: @product.id)
	if @comment.destroy
	else
		@product = Product.find(params[:product_id])
	   render :"show"
	end
end

private
def product_comment_params
	params.require(:product_comment).permit(:end_user_id, :product_id, :comment)
end
end
