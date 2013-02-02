# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartlink/version'

Gem::Specification.new do |gem|
  gem.name          = "smartlink"
  gem.version       = Smartlink::VERSION
  gem.authors       = ["Vasilij Melnychuck"]
  gem.email         = ["isqrel@gmail.com"]
  gem.description   = %q{ Gem for linkfying your text }
  gem.summary       = %q{ This gem parses urls from your text and create links from it }
  gem.homepage      = "https://github.com/SqREL/smartlink"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  ['rspec'].each do |dep|
    gem.add_development_dependency(dep)
  end
end
