# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartlinks/version'

Gem::Specification.new do |gem|
  gem.name          = "smartlinks"
  gem.version       = Smartlinks::VERSION
  gem.authors       = ["Vasilij Melnychuck", "Igor Petruh"]
  gem.email         = ["isqrel@gmail.com", "pro100igor@gmail.com"]
  gem.description   = %q{ Gem for linkfying your text }
  gem.summary       = %q{ Smartlinks converts your palin-text urls, twitter-like accounts and hashtag links to html a tags }
  gem.homepage      = "https://github.com/SqREL/smartlinks"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  ['rspec'].each do |dep|
    gem.add_development_dependency(dep)
  end
end
