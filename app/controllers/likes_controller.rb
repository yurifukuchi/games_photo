class LikesController < ApplicationController 
  before_action :set_post

  def create
    @like = current_user.likes.create(post_id: params[:post_id],id:params)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
