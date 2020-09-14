require_relative 'lib/unleashed_client/version'

Gem::Specification.new do |spec|
  spec.name          = "unleashed_client"
  spec.version       = UnleashedClient::VERSION
  spec.authors       = ["thecookieorg"]
  spec.email         = ["marko.manojlovic.bg@gmail.com"]

  spec.summary       = %q{A Ruby wrapper for Unleashed API https://apidocs.unleashedsoftware.com}
  spec.description   = %q{A Ruby wrapper for Unleashed API https://apidocs.unleashedsoftware.com}
  spec.homepage      = "https://github.com/thecookieorg/unleashed_client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/thecookieorg/unleashed_client"
  spec.metadata["changelog_uri"] = "https://github.com/thecookieorg/unleashed_client/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', '~> 0.18.0', '>= 0.18.1' 
  
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "dotenv", '~> 2.7', '>= 2.7.6'
end
