class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :plan_id
  
end
