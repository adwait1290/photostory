class SessionsController < ApplicationController
	def create
			@user = User.find_by_email(params[:session][:email])
			if @user && @user.authenticate(params[:session][:password])

				session[:user_id] = @user.id
				print params[:session][:password]
				redirect_to photos_show_path
			else
				flash[:login_error] = "Could not find a user with that email and password combination"
				puts flash[:login_error]
				redirect_to root_path
			end
	end
	def destroy
		session[:user_id] = nil
		flash[:message] = "You have successfully logged out"
		redirect_to session_path
	end
end

