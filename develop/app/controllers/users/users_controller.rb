class Users::UsersController < ApplicationController
  def show
  	@user = current_user
    @address = Address.find(params[:id])
    @address = @user.addresses.all
  end

  def edit
  end

	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    	else
    	end
    	redirect_to user_path(current_user)
	end
end
