# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glimpse-sidekiq/version'

Gem::Specification.new do |gem|
  gem.name          = 'glimpse-sidekiq'
  gem.version       = Glimpse::Sidekiq::VERSION
  gem.authors       = ['David Parry']
  gem.email         = ['david.parry@suranyami.com']
  gem.description   = %q{Provide a glimpse into the Sidekiq calls made within your Rails application.}
  gem.summary       = %q{Provide a glimpse into the Sidekiq calls made within your Rails application.}
  gem.homepage      = 'https://github.com/suranyami/glimpse-sidekiq'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'glimpse'
  gem.add_dependency 'sidekiq'
end
