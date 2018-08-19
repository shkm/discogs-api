module Discogs::Api::Url
  BASE_URL = 'https://api.discogs.com'.freeze

  def self.resolve(*segments)
    [BASE_URL, *segments].join('/')
  end
end
