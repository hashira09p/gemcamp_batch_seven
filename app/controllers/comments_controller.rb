class CommentsController < ApplicationController
  before_action :set_post
  def index
    @comments = @post.comments.all
  end
  def show;end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    
  end
end