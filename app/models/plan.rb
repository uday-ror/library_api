class Plan < ApplicationRecord
	has_many :books
	# has_many :users
	belongs_to :user
	belongs_to :admin
end
