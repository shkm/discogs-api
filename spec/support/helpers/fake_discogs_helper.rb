module FakeDiscogsHelper
  def with_fake_discogs_server(example)
    WebMock.disable_net_connect!(allow_localhost: true)

    old_discogs_endpoint = ENV['DISCOGS_ENDPOINT']
    ENV['DISCOGS_ENDPOINT'] = 'http://localhost:8080'

    unless Thread.current[:fake_discogs_server]
      server_started = false

      Thread.current[:fake_discogs_server] = Thread.new do
        require 'support/fake_discogs.rb'
        Rack::Handler::WEBrick.run(
          Cuba,
          Logger: WEBrick::Log.new(File.open(File::NULL, 'w')),
          AccessLog: [],
          StartCallback: -> { server_started = true }
        )
      end

      sleep(0.05) until server_started
    end

    example.run

    ENV['DISCOGS_ENDPOINT'] = old_discogs_endpoint
  end
end
