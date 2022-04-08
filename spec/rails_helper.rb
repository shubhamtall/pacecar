# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rspec/rails'

require 'fake_app'
require 'pacecar'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

require 'factory_bot'
require 'factories'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include(FactoryBot::Syntax::Methods)
end
