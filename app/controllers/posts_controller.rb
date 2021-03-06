class PostsController < ApplicationController
  before_action :redirect_to_top, except: [:index, :search, :show]
  before_action :current_user,      only: [:destroy, :edit]
  before_action :post_set,          only: [:edit, :update, :show]

  def index
    @posts = Post.all.page(params[:page]).order("created_at desc")
    require "date"
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @day = Date.today
    @post.created_at == @day

    if @post.save
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
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

  def post_set
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text,:image,:post_category_id)
  end
    
end
