class UserSerializer < ActiveModel::Serializer
  attributes :username,
             :bio,
             :posts_count,
             :comments_count
end
