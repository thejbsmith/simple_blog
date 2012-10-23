module SimpleBlog
  class Engine < ::Rails::Engine
    isolate_namespace SimpleBlog

    initializer :simple_blog do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end
  end
end
