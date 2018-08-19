lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib)

require "discogs/api/version"

Gem::Specification.new do |spec|
  spec.name          = 'discogs-api'
  spec.version       = Discogs::Api::VERSION
  spec.authors       = ['Jamie Schembri']
  spec.email         = ['jamie@schembri.me']

  spec.summary       = %q{Discogs API client in Ruby}
  spec.homepage      = 'https://github.com/shkm/discogs-api'
  spec.license       = 'MIT'

  spec.files = Dir['LICENSE', 'README.md', 'lib/**/*.rb']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'cuba'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock'
  spec.add_dependency 'http'
end
