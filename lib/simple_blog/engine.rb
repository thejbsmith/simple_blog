require 'will_paginate'
require 'meta_tags'
require 'rich'

module SimpleBlog
  class Engine < ::Rails::Engine
    isolate_namespace SimpleBlog

    initializer :simple_blog do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      end
    end
  end
end
