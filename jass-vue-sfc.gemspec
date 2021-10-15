lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jass/vue/sfc/version'

Gem::Specification.new do |s|
  s.name          = 'jass-vue-sfc'
  s.version       = Jass::Vue::SFC::VERSION
  s.date          = '2021-10-15'
  s.authors       = ['Matthias Grosser']
  s.email         = ['mtgrosser@gmx.net']
  s.license       = 'MIT'

  s.summary       = 'Compile Vue SFCs for Sprockets'
  s.homepage      = 'https://github.com/mtgrosser/jass-vue-sfc'

  s.files = ['LICENSE', 'README.md'] + Dir['lib/**/*.rb']
  
  s.required_ruby_version = '>= 2.3.0'
  
  s.add_dependency 'nodo', '>= 1.5.6'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'minitest'
end
