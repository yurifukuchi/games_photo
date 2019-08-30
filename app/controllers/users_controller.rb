class UsersController < ApplicationController
  def show
    @posts = Post.where(user_id:params[:id]).order("created_at desc")
    require "date"
    @user = User.find(params[:id])
  end
end
