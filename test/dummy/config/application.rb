require_relative 'boot'

%w[
  action_controller/railtie
  rails/test_unit/railtie
].each do |railtie|
  require railtie
end

Bundler.require(*Rails.groups)
require "loco/core"

module Dummy
  class Application < Rails::Application
    config.load_defaults 6.0
  end
end

