require_dependency "simple_blog/application_controller"

module SimpleBlog
  class CommentsController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params[:comment])

      if simple_blog_current_user
        @comment.commenter_id = simple_blog_current_user.id
      end

      if @post.save
        flash[:notice] = "Comment has been created!"
        #redirect_to post_path(@post)
        redirect_to post_path(@post.slug)
      else
        # TODO: Want to make sure we're handling this correctly
        flash[:notice] = "There was a problem saving your comment"
        redirect_to post_path(@post.slug)
      end
    end

  end
end
