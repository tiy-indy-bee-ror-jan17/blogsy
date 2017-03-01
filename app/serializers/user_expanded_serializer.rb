class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :email, :auth_token, :id
end
