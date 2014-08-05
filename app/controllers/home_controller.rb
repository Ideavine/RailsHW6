class HomeController < ApplicationController
	def index
		@title = "Home"
	end

	def contact
		@title = "Contact"
	end

	def join
		@title = "Join"
		redirect_to users_path
	end

	def logo
	end

	def header
	end

	def footer
	end

	def search
		@user = User.find(params[:id])
		puts User.all
	end

end

