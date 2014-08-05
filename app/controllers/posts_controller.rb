class PostsController < ApplicationController
	
# 	def new
# 		@post = Post.new
# 	end

# 	def show
# 		@post = Post.all
#  		end
# 	end

# 	def create
# 		@post = Post.new
#   		if @post.save
#     	redirect_to @post, notice: "The post #{@post_title} was added to the system."
#   		else
#     	render action: 'new'
#   		end
# 	end
# end

	def index
		# @ is an instance variable, we do this to pass it to the controller
		@user = User.find(params[:user_id])
		@post = @user.posts
 			if @posts.present?
 				flash[:notice] = "Posts displayed successfully."
 			else
 				flash[:alert] = "Sorry, there were no posts to display."
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
		p = Post.find(params[:post_id])
		if p.destroy
 			flash[:notice] = "Post deleted successfully."
 			redirect_to home_path
 		else
 			flash[:alert] = "There was a problem deleting the user."
 			redirect_to home_path
		end
	end

# posts/new
	def new
		@user = User.find(params[:user_id])
		@post =  @user.posts.new(params[:id])
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			 flash[:notice] = "Your post was created 
			 successfully."
			 redirect_to posts_path @post
		else
			 flash[:alert] = "There was a problem saving your 
			 post."
			 redirect_to new_post_path
		end
 	end

 	def edit
 		@user = User.find(params[:user_id])
 		@post =  @user.posts(params[:id])
 	end

 	def update
 		 post = Post.find(params[:post_id])
 		if post.update(params[:post])
 			flash[:notice] = "Your post was updated"
 			redirect_to posts_path 
 		else
 			flash[:notice] + "There was an error updating your post. Please try again."
 			redirect_to edit_post_path
 		end
 	end
end