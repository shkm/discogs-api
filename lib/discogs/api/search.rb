module Discogs::Api::Search
  def self.artist(client, params = {})
    execute(client, { type: :artist }.merge(params))
  end

  def self.release(client, params = {})
    execute(client, { type: :release }.merge(params))
  end

  def self.master(client, params = {})
    execute(client, { type: :master }.merge(params))
  end

  def self.label(client, params = {})
    execute(client, { type: :label }.merge(params))
  end

  private_class_method def self.execute(client, params = {})
    params[:q] = params.delete(:query) if params[:query]

    url = Discogs::Api::Url.resolve('database', 'search').freeze

    client.get(url, params: params)
  end
end
