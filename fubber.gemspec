require_relative 'lib/fubber/version'

Gem::Specification.new do |spec|
  spec.name          = "fubber"
  spec.version       = Fubber::VERSION
  spec.authors       = ["Ilia Lobsanov"]
  spec.email         = ["ilia@lobsanov.com"]

  spec.summary       = %q{API Client for Followupboss.com}
  spec.homepage      = "https://github.com/zoocasa/fubber"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zoocasa/fubber"
  spec.metadata["changelog_uri"] = "https://github.com/zoocasa/fubber/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.18.1'
  spec.add_dependency 'activesupport', '>= 6.0.3.4', '< 6.2.0'

  spec.add_development_dependency 'byebug', '~> 11.1.3'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
  spec.add_development_dependency 'vcr', '~> 6.0.0'
  spec.add_development_dependency 'webmock', '~> 3.10.0'
end
