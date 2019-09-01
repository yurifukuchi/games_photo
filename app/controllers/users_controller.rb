class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = Post.where(user_id:params[:id]).order("created_at desc")
    require "date"
  end

  def likes
    @posts = Post.where(user_id:params[:id]).order("created_at desc")
    require "date"
    @posts = @user.liked_posts
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

end
