class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :subject, :price 
  # belongs_to :admin
end
