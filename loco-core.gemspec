$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "loco/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "loco-rails-core"
  spec.version     = Loco::Core::VERSION
  spec.authors     = ["Zbigniew Humeniuk"]
  spec.email       = ["hello@artofcode.co"]
  spec.homepage    = "http://locoframework.org"
  spec.summary     = "Core part of the Loco framework"
  spec.description = "Loco::Core provides logical structure for a JavaScript code. You exactly know where to start looking for a JavaScript code that powers current page."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0"

  spec.add_development_dependency "sqlite3"
end
