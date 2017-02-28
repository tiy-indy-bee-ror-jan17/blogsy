class User < ApplicationRecord
  has_many :posts

  validates :username, :email, presence: true
end
