class SessionsController < ApplicationController
 #route for login form
 	def new
 	end
 #processes data from login form
 	def create
		user = User.where(username: params[:username]).first
		# user = User.where(:username => params[:username]).first
		if user && user.password == params[:password]
		  session[:user_id] = user.id 
		  return redirect_to in_path
		end

		return redirect_to "/index"
 	end
 	
 	#route for logging out a user
	def destroy
		 Session.destroy(@user_session)
		 session[:user_id] = nil
		 flash[:notice] = "You are now logged out"
		 redirect_to home_path
	end

	def show
    @user = User.find(params[:id]) 
  	end

  	def greet
 	return "hello, #{fname}#"
 	end
end


