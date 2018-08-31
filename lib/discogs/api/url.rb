module Discogs::Api::Url
  DEFAULT_ENDPOINT = 'https://api.discogs.com'.freeze

  def self.resolve(*segments)
    [ENV.fetch('DISCOGS_ENDPOINT', DEFAULT_ENDPOINT), *segments].join('/')
  end
end
