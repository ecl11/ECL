class ApplicationController < ActionController::Base

        before_action :set_header
        before_action :configure_permitted_parameters, if: :devise_controller?

	    protected

	    def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:sign_up, keys: [:address_id, :family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, :is_deleted])
	    end


	    
end
