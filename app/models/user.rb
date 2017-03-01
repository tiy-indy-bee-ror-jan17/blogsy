class User < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password
  has_secure_token :auth_token

  validates :username, :email, presence: true

  def comments_count
    comments.count
  end

end
