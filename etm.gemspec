# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'etm/version'

Gem::Specification.new do |spec|
  spec.name          = 'etm'
  spec.version       = Etm::VERSION
  spec.authors       = ['Hassan Ahmed']
  spec.email         = ['Hassantc.mahmoud@gmail.com']

  spec.summary       = %(Escape the matrix Client side)
  spec.description   = %(Escape the matrix client side hacking program)
  spec.homepage      = 'https://github.com/assenvic/etm'

  spec.metadata['homepage_uri'] = spec.homepage

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'factory_bot', '~> 5.1', '>= 5.1.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'dry-struct', '~> 1.2'
  spec.add_dependency 'dry-types', '~> 1.2', '>= 1.2.2'
  spec.add_dependency 'faraday', '~> 1.0'
  spec.add_dependency 'zipruby', '~> 0.3.6'
end
