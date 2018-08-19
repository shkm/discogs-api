module Discogs::Api::Artists
  def self.get(client, artist_id)
    client.get Discogs::Api::Url.resolve('artists', artist_id)
  end
end
