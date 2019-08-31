class PostsController < ApplicationController
  before_action :redirect_to_top,except: [:index,:search]
  before_action :current_user,     only: [:destroy]


  def index
    @posts = Post.all.page(params[:page]).order("created_at desc")
    require "date"
    @day = Date.today
    @like = Like.new
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
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:search])
    @posts = @posts.page(params[:page]).order("created_at desc")
    require "date"
    @day = Date.today
  end

  private
  def redirect_to_top
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:text,:image,:post_category_id)
  end

  
end
