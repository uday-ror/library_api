class Admin < ApplicationRecord
 require "securerandom"
	has_secure_password
	
	has_many :books
	has_many :plans
end
