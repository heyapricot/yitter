class LikesController < ApplicationController
  include ActionView::RecordIdentifier
  def update
    if likes.exists?
      likes.destroy_all
    else
      likes.first_or_create(user: current_user)
    end

    turbo_streams = [
      turbo_stream.replace("likes-count", partial: "remaining_likes", locals: { remaining_likes_quantity: User::LIKE_LIMIT - current_user.likes.count } ),
      turbo_stream.replace(dom_id(post), partial: "posts/post", locals: { post: post })
    ]
    
    render turbo_stream: turbo_streams
  end

  private

  def likes
    @likes ||= post.likes.where(user: current_user)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
