# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sloc/version'

Gem::Specification.new do |spec|
  spec.name          = 'sloc'
  spec.version       = Sloc::VERSION
  spec.authors       = ['meganemura']
  spec.email         = ['meganemura@users.noreply.github.com']

  spec.summary       = 'A tool for counting source lines of code'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/meganemura/sloc'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'slop', '~> 3.0'

  spec.add_development_dependency 'bundler', '>= 1.7'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
