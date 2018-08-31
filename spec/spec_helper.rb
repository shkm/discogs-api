require 'simplecov'
require 'codecov'
require 'bundler/setup'
require 'discogs/api'
require 'webmock/rspec'
require 'support/helpers/fake_discogs_helper'
require 'support/helpers/fixtures_helper'
require 'support/helpers/hash_helper'
require 'support/helpers/request_helper'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

RSpec.configure do |config|
  config.include FakeDiscogsHelper
  config.include FixturesHelper
  config.include HashHelper
  config.include RequestHelper

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
