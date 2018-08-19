module Discogs::Api::Search
  def self.artist(client, params = {})
    execute(client, { type: :artist }.merge(params))
  end

  private_class_method def self.execute(client, params = {})
    params[:q] = params.delete(:query) if params[:query]

    url = Discogs::Api::Url.resolve('database', 'search').freeze

    client.get(url, params: params)
  end
end
