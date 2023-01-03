class User < ApplicationRecord
	has_secure_password
	
	# validates_presence_of :plan_id
    validates :email, uniqueness: true
	validates :password, length: { minimum: 6 }
	belongs_to :plan
	has_many :issue_book
end
