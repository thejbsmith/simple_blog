require "simple_blog/engine"

module SimpleBlog

  # Posts
  mattr_accessor :author_user_class
  mattr_accessor :author_user_class_display_field
  mattr_accessor :author_scope
  @@author_scope = 'all'

  # Comments
  mattr_accessor :enable_comments
  @@enable_comments = true

  mattr_accessor :commenter_user_class
  mattr_accessor :commenter_user_class_display_field

  mattr_accessor :only_allow_users_to_comment
  @@only_allow_users_to_comment = true

  mattr_accessor :current_user_method

end
