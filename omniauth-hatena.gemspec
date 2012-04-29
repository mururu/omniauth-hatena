# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/omniauth-hatena/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yuki Ito"]
  gem.email         = ["yuki@gnnk.net"]
  gem.description   = %q{OmniAuth strategy for Hatena}
  gem.summary       = %q{OmniAuth strategy for Hatena}
  gem.homepage      = "https://github.com/mururu/omniauth-hatena"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-hatena"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Hatena::VERSION

  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.9'
  gem.add_development_dependency 'rake', '~> 0.9.2.2'
end
