require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module Jobblee
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/lib)
  end
end
