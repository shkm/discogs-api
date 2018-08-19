require 'bundler/setup'
require 'discogs/api'
require 'webmock/rspec'
require 'support/helpers/fake_discogs_helper'
require 'support/helpers/fixtures_helper'
require 'support/helpers/request_helper'
require 'support/helpers/hash_helper'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FakeDiscogsHelper
  config.include FixturesHelper
  config.include RequestHelper
  config.include HashHelper

  config.before(:suite) do
    WebMock.disable_net_connect!(allow_localhost: true)

    server_started = false

    Thread.new do
      require 'support/fake_discogs.rb'
      Rack::Handler::WEBrick.run(
        Cuba,
        Logger: WEBrick::Log.new(File.open(File::NULL, 'w')),
        AccessLog: [],
        StartCallback: -> { server_started = true }
      )
    end

    sleep(0.1) until server_started
  end
end
