class Book < ApplicationRecord
	# belongs_to :plan, :through => :book
	belongs_to :issue_book
	belongs_to :admin
	
end
