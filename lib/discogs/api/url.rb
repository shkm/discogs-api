module Discogs::Api::Url
  BASE_URL = "https://api.discogs.com"

  def self.path(*segments)
    [BASE_URI, *segments].join('/')
  end
end
