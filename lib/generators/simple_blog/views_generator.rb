require 'rails/generators'

module SimpleBlog
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views/simple_blog", __FILE__)

      desc "Copies SimpleBlog's views to your directories"

      def copy_views
        view_directory :comments
        view_directory :posts
        view_directory :shared
      end

      protected

      def view_directory(name)
        directory name.to_s, "app/views/simple_blog/#{name}"
      end
    end
  end
end
