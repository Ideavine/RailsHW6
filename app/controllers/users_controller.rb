class UsersController < ApplicationController

	def index
		# @ is an instance variable, we do this to pass it to the controller
		@users = User.all
 		if @users.present?
 			flash[:notice] = "Users display successfully."
 		else
 			flash[:alert] = "Sorry, there were no users to display."
 		end
	end


#/users//:id
	def show
		@id = params[:id]
		@user = User.find(@id)
	end

	def destroy
		u = User.find(params[:id])
		if u.destroy
 			flash[:notice] = "User deleted successfully."
 			redirect_to home_path
 		else
 			flash[:alert] = "There was a problem deleting the user."
 			redirect_to home_path
		end
	end
# users/new
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			 flash[:notice] = "Your account was created 
			 successfully."
			 redirect_to user_path @user
		else
			 flash[:alert] = "There was a problem saving your 
			 account."
			 redirect_to new_user_path
		end

		private
 		def user_params
 		params.require(:user).permit(:fname, :lname, :email)
 		end
 	end

 	def edit
 		@user = User.find(params[:id])
 	end

 	def update
 		 user = User.find(params[:id])
 		if user.update(params[:user])
 			flash[:notice] = "Your account was updated"
 			redirect_to user_path user
 		else
 			flash[:notice] + "There was an error updating your account. Please try again."
 			redirect_to edit_user_path_user
 		end
 	end

 	

end