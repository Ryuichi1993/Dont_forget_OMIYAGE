class Admins::EndUsersController < ApplicationController
	def index
		@end_user = EndUser.with_deleted
	end

	def show
		@end_user = EndUser.with_deleted.find(params[:id])
	end

	def edit
		@end_user = EndUser.with_deleted.find(params[:id])

	end

	def update
		@end_user = EndUser.with_deleted.find(params[:id])
		if @end_user.update(end_user_params)
		case params[:status]
		when "0"
			@end_user.restore
			redirect_to admins_end_users_path
		when "1"
			@end_user.destroy
			redirect_to admins_end_users_path
		else
			render :edit
		end
	end
	end

	def destroy

	end

	private
	def end_user_params
		params.require(:end_user).permit(:name, :introduction, :profile_image, :deleted_at)
	end
end

