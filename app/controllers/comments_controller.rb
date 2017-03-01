class CommentsController < ApplicationController

  def index
    post = Post.find(params[:id])
    render json: post.comments
  end

end
