require_relative 'boot'

%w[
  action_controller/railtie
  rails/test_unit/railtie
].each do |railtie|
  require railtie
end

Bundler.require(*Rails.groups)
require "loco-rails-core"

module Dummy
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end

