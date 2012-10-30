class SimpleBlog::ApplicationController < ApplicationController

  def simple_blog_current_user
    eval(SimpleBlog.current_user_method)
  end
  helper_method :simple_blog_current_user

end
