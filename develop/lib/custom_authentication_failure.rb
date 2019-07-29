class CustomAuthenticationFailure < Devise::FailureApp

	protected
    def redirect_url
    	users_items_path
    end
end