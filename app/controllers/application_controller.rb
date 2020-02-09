class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		case resource
		when Admin
			flash[:notice] = "Signed in successfully."
			admins_path
		when Producer
			flash[:notice] = "Signed in successfully."
			producers_producer_path(current_producer)
		when EndUser
			flash[:notice] = "Signed in successfully."
			end_users_end_user_path(current_end_user)
		end
	end

	def after_sign_up_path_for(resource)
		case resource
		when Admin
			flash[:notice] = "Signed in successfully."
			admins_path
		when Producer
			flash[:notice] = "Signed in successfully."
			producers_producer_path(current_producer)
		when EndUser
			flash[:notice] = "Signed in successfully."
			end_users_end_users_path(current_end_user)
		end
	end

end
