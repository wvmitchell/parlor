# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parlor/version'

Gem::Specification.new do |spec|
  spec.name          = "parlor"
  spec.version       = Parlor::VERSION
  spec.authors       = ["Will Mitchell"]
  spec.email         = ["wvmitchell@gmail.com"]
  spec.summary       = %q{A gem for adding games to your webpage}
  spec.homepage      = "https://github.com/wvmitchell/parlor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.default_executable = 'enter_parlor'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "sinatra"
end
