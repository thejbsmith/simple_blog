require 'rails/generators'

module SimpleBlog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      desc "Installs SimpleBlog"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end
      
      def copy_initializer
        template 'simple_blog.rb.erb', 'config/initializers/simple_blog.rb'
      end
      
      def setup_route
        route "mount SimpleBlog::Engine => '/blog', :as => 'blog'"
      end
      
      def create_migrations
        rake "simple_blog:install:migrations"
      end

      def install_rich
        generate "rich:install"
      end
      
    end
  end
end
