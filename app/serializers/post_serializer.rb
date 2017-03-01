class PostSerializer < ActiveModel::Serializer
  attributes :title, :body, :username, :votes

  def username
    # `object` is the object being serialized.
    # In this case, a Post object
    object.user.username
  end

end
