class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post Created Successfully!'
      redirect_to root_path
    end
  end

  def edit;end

  def update
    if @post.update(post_params)
      flash[:notice] = "Updated Successfully"
      redirect_to root_path
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
