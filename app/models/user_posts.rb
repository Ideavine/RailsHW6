class UserPosts < ActiveRecord::Base
	validates :post_title, presence: true
end
