class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		case resource
		when Admin
			flash[:notice] = "Signed in successfully."
			admins_tops_path
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
			admins_tops_path
		when Producer
			flash[:notice] = "Signed in successfully."
			producers_producer_path(current_producer)
		when EndUser
			flash[:notice] = "Signed in successfully."
			end_users_end_users_path(current_end_user)
		end
	end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

end
