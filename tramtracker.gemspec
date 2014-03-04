# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/tramtracker/version'

Gem::Specification.new do |gem|
  gem.name          = "tramtracker"
  gem.version       =  Tramtracker::VERSION
  gem.authors       = ["Steven Occhipinti"]
  gem.email         = ["dev@stevenocchipinti.com"]
  gem.description   = "A commandline tool for Melbourne's TramTracker"
  gem.summary       = "CLI TramTracker"
  gem.homepage      = "https://github.com/stevenocchipinti/tramtracker"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
