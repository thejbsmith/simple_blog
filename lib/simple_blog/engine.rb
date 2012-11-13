require 'kaminari'
require 'meta_tags'
require 'rich'

module SimpleBlog
  class Engine < ::Rails::Engine
    isolate_namespace SimpleBlog

    initializer :simple_blog do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/admin']   # prepending to load path, this allows you to override the ActiveAdmin resources in parent application
      end
    end

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        Rails.logger.info "requiring: #{c}"
        require_dependency(c)
      end
    end

  end
end
