# -*- encoding: utf-8 -*-
require File.expand_path('../lib/modularize_sinatra/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ankit Goyal"]
  gem.email         = ["ankit3goyal@gmail.com"]
  gem.description   = %q{Code Generator for Sinatra}
  gem.summary       = %q{Code Generator for Sinatra}
  gem.homepage      = "http://goyalankit.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "modularize_sinatra"
  gem.require_paths = ["lib"]
  gem.version       = ModularizeSinatra::VERSION
  gem.add_dependency "rake"
end
