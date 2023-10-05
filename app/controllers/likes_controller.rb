class LikesController < ApplicationController
  def update
    if likes.exists?
      likes.destroy_all
    else
      likes.first_or_create(user: current_user)
    end
  end

  private

  def likes
    @likes ||= post.likes.where(user: current_user)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
