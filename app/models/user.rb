class User < ActiveRecord::Base
	validates_presence_of :email
	# other options include
	# validates :name, presence: true
	# validates :terms, acceptance: true
	# validates :size, inclusion: {in: [“short”, “tall”, “grande”]}
	# validates :username, length: {minimum: 4, maximum: 30} 
	# validates :username, numericality: true
	has_many :posts
	has_many :transactions
end
