class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.posts_by(current_user)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
    authorize @post
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Your post was successfully created"
    else
      render :new
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Your post was successfully updated"
    else
      render :edit, notice: "Something went wrong, please check if filled the information correctly"
    end
  end

  def destroy
    if @post.delete
      redirect_to posts_path, notice: "Post was successfully deleted"
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
