# frozen_string_literal: true

class Producers::SessionsController < Devise::SessionsController
def after_sign_out_path_for(resource)
  flash[:notice] = "Signed out successfully."
  new_producer_session_path

end
end
