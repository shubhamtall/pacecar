# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path('lib', __dir__))
require 'pacecar/version'

Gem::Specification.new do |s|
  s.name          = 'pacecar'
  s.version       = Pacecar::VERSION.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = [
    'Matt Jankowski',
    'Gabe Berke-Williams',
    'Chad Pytel',
    'Ryan McGeary',
    'Mike Burns',
    'Ryan Sonnek',
    'Thomas Dippel',
    'Tristan Dunn'
  ]
  s.email         = 'support@thoughtbot.com'
  s.homepage      = 'http://github.com/thoughtbot/pacecar'
  s.summary       = 'Pacecar adds scope methods to ActiveRecord classes via database column introspection.'
  s.description   = 'Generated scopes for ActiveRecord classes.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency('activerecord', '~> 6.0')

  s.add_development_dependency('appraisal', '~> 2.4')
  s.add_development_dependency('factory_bot_rails', '~> 4.9')
  s.add_development_dependency('rspec-rails', '~> 4.1')
  s.metadata['rubygems_mfa_required'] = 'true'
end
