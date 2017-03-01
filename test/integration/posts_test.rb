require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest

  def setup
    10.times { create(:comment) }
  end

  test 'posts#index' do
    get "/posts"
    assert response.ok?
    json = JSON.parse(response.body)
    assert json.first["username"]
  end

  test 'users#index' do
    get '/users'
    assert response.ok?
    json = JSON.parse(response.body)
    assert json.first["posts_count"]
    assert json.first["username"]
    refute json.first["email"]
  end

  test 'users#create' do
    post "/users",
      params: {
        user: {
          username: "my_username",
          email: "test@example.com",
          bio: "My funky bio",
          password: Faker::Internet.password
        }
      }
    assert response.ok?
    assert_equal "my_username", User.last.username
    json = JSON.parse(response.body)
    assert_equal "my_username", json["username"]
    refute json["password"]
    refute json["password_digest"]
    assert json["auth_token"]
  end

  test 'posts#show' do
    post = Post.last
    get "/posts/#{post.id}"
    assert response.ok?
    json = JSON.parse(response.body)
    assert json["username"]
  end

  test 'comments#index' do
    post_ids = Post.pluck(:id)
    user_ids = User.pluck(:id)
    36.times do
      Comment.create!(
        body: Faker::TwinPeaks.quote,
        user_id: user_ids.sample,
        post_id: post_ids.sample
      )
    end
    comment = Comment.last
    get "/posts/#{comment.post_id}/comments"
    assert response.ok?
    json = JSON.parse(response.body)
    assert_equal comment.post.comments.size, json.length
    assert json.detect{|com| com["body"] == comment.body}

  end

  def test_token_auth
    user = User.last
    get "/posts?auth_token=#{user.auth_token}"
    assert response.ok?
    json = JSON.parse(response.body)
    assert_equal user.posts.count, json.length
  end

end
