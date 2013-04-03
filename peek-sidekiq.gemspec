# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-sidekiq/version'

Gem::Specification.new do |gem|
  gem.name          = 'peek-sidekiq'
  gem.version       = Peek::Sidekiq::VERSION
  gem.authors       = ['David Parry']
  gem.email         = ['david.parry@suranyami.com']
  gem.description   = %q{Provide a peek into the Sidekiq calls made within your Rails application.}
  gem.summary       = %q{Provide a peek into the Sidekiq calls made within your Rails application.}
  gem.homepage      = 'https://github.com/suranyami/peek-sidekiq'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'peek'
  gem.add_dependency 'sidekiq'
  gem.add_dependency 'atomic', '>= 1.0.0'

end
