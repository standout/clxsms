# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clxsms/version'

Gem::Specification.new do |spec|
  spec.name          = "clxsms"
  spec.version       = Clxsms::VERSION
  spec.authors       = ["Hüseyin Öztürk"]
  spec.email         = ["support@standout.se"]

  spec.summary       = "API wrapper for Clxnetworks's SMS service"
  spec.description   = "API wrapper for Clxnetworks's SMS service"
  spec.homepage      = "https://bitbucket.org/standoutab/clxsms"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", '~> 1.8'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
