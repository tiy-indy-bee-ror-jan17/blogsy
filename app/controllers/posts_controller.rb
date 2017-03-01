class PostsController < ApplicationController

  before_action :find_post, only: [:show, :destroy, :upvote]
  before_action :require_user, only: [:upvote, :destroy]

  def index
    if current_user
      @posts = current_user.posts
    else
      @posts = Post.all
    end
    render json: @posts
  end

  def show
    render json: @post
  end

  def destroy
    @post.destroy
    render status: 200
  end

  def upvote
    @post.increment!(:votes)
    render json: @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
