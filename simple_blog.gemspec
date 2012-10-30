$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_blog"
  s.version     = SimpleBlog::VERSION
  s.authors     = ["Jim Smith"]
  s.email       = ["jim@jimsmithdesign.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SimpleBlog."
  s.description = "TODO: Description of SimpleBlog."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # TODO: Need to actually figure out which version of rails is required.
  s.add_dependency 'rails', '~> 3.2.0'
  # s.add_dependency "jquery-rails"
  s.add_dependency 'will_paginate', '~> 3.0'
  s.add_dependency 'rich'

  s.add_dependency 'meta-tags'

  # s.add_development_dependency "sqlite3"
end
