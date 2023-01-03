class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :books
end
