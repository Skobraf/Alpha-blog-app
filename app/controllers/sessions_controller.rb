class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfulu logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "there was something wrong with your login"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:sucess] = 'You have logged out'
		redirect_to root_path
	end
end