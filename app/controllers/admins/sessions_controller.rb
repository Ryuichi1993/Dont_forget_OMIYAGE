# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
def after_sign_out_path_for(resource)
  flash[:notice] = "Signed out successfully."
  new_admin_session_path

end
end