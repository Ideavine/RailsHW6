class Post < ActiveRecord::Base
	validates :post_title, presence: true
	
	belongs_to :users
	belongs_to :topic
end
