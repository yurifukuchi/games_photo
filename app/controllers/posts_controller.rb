class PostsController < ApplicationController
  before_action :redirect_to_top,except: [:index]
  def index
    @posts = Post.includes(:user,:post_category).order("created_at desc")
    require "date"
    @day = Date.today
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # if @post.update(post_params)
    #   redirect_to root_path
    # else
    #   render action: 'edit'
    # end
  end

  def destroy
  end

  private
  def redirect_to_top
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:name,:text,:image,:post_category_id)
  end
end
