class LikesController < ApplicationController
  include ActionView::RecordIdentifier
  def update
    if likes.exists?
      likes.destroy_all
    elsif current_user.likes.count < User::LIKE_LIMIT
      likes.first_or_create(user: current_user)
    else
      errors = "You've reached the like limit"
    end

    turbo_streams = [
      turbo_stream.replace("top-card", partial: "posts/top_card", locals: { name: current_user.name, remaining_likes_quantity: User::LIKE_LIMIT - current_user.likes.count, errors: errors } ),
      turbo_stream.replace(dom_id(resource), partial: "posts/#{resource_name}", locals: { "#{resource_name}".to_sym => resource })
    ]
    
    render turbo_stream: turbo_streams
  end

  private

  def likes
    @likes ||= resource.likes.where(user: current_user)
  end

  def resource
    post = Post.find(params[:post_id])
    @resource ||= if params[:comment_id]
                    post.comments.find(params[:comment_id])
                  else
                    post
                  end
  end

  def resource_name
    @resource_name ||= resource.class.name.downcase
  end
end
