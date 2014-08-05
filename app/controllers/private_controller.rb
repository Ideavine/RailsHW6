class PrivateController < ApplicationController

	 def index
	 	if @user = User.find(session[:user_id])
			redirect_to user_posts_path @user.id
	 	else
	 		session [:user_id].nil?
	 		redirect_to '/login'
		end
	end
end
