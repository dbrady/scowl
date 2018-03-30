# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scowl/version'

Gem::Specification.new do |spec|
  spec.name          = "scowl"
  spec.version       = Scowl::VERSION
  spec.authors       = ["David Brady"]
  spec.email         = ["dbrady@covermymeds.com"]

  spec.summary       = %q{Tighten gem versions in your Gemfile}
  spec.description   = %q{Add, update or tighten gem versions in your Gemfile.}
  spec.homepage      = "https://github.com/dbrady/scowl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "trollop", "~> 2.1"
  spec.add_runtime_dependency "colorize", "~> 0.8.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
end
