require 'rails/generators'

module SimpleBlog
  module Generators
    class ActiveAdminViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../lib/simple_blog", __FILE__)

      desc "Copies SimpleBlog's ActiveAdmin views to your directories"

      def copy_views
        view_directory :admin
      end

      protected

      def view_directory(name)
        directory name.to_s, "app/#{name}"
      end
    end
  end
end
