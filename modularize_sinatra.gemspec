# -*- encoding: utf-8 -*-
require File.expand_path('../lib/modularize_sinatra/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ankit Goyal"]
  gem.email         = ["ankit3goyal@gmail.com"]
  gem.description   = %q{Code Generator for Sinatra}
  gem.summary       = %q{Creates a modular skeleton for Sinatra application.}
  gem.homepage      = "https://github.com/goyalankit/modularize_sinatra"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "modularize_sinatra"
  gem.require_paths = ["lib"]
  gem.version       = ModularizeSinatra::VERSION
  gem.add_development_dependency "rake"
  gem.add_dependency "rubigen"
  gem.add_dependency 'activesupport', '>= 2.3.5', "< 3.2.0"
end
