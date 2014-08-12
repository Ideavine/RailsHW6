class PostsController < ApplicationController


	def index
		# @ is an instance variable, we do this to pass it to the controller
		@user = User.find(params[:user_id])
		@post = @user.posts
 			if @posts.present?
 				flash[:notice] = "Posts displayed successfully."
 			else
 				flash[:alert] = "Sorry, there were no posts to show."
 			end
 	end


#/posts//:id
	def show

		# # @id = params[:id]
		# # @post = Post.find(@post_id)

		# @post = Post.find(params[:post_id])
 	# 	@user = User.find(params[:user_id])
 	# 	@post = @user.posts(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
 			flash[:notice] = "Post deleted successfully."
 			redirect_to home_path
 		else
 			flash[:alert] = "There was a problem deleting the post. Please try again."
 			redirect_to home_path
		end
	end

# posts/new
	def new
		@user = User.find(params[:user_id])
		@post =  @user.posts.new(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.new(params[:id])
		if @post.save
			 flash[:notice] = "Your post #{@post_title} was created 
			 successfully."
			 redirect_to user_post_path @post, @user
		else
			 flash[:alert] = "There was a problem saving your 
			 post."
			 redirect_to new_user_post_path 
		end
 	end

 	def edit
 		@user = User.find(params[:user_id])
 		@post = Post.find(params[:id])
 	end

 	def update
 		@post = Post.find(params[:id])
 		@user = User.find(params[:user_id])
 		if @post.update(post_params)
 			flash[:notice] = "Your post was updated"
 			redirect_to user_post_path @user, @post
 		else
 			render 'edit'
 		end
 	end

	private
	def post_params
	  params.require(:post).permit(:post_title, :post_text)
	end

end



