class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id],id:params)
    @post = Post.find(params[:post_id])
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    @post = Post.find(params[:post_id])
  end
end
