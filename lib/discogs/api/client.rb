require 'forwardable'

class Discogs::Api::Client
  extend Forwardable

  def_delegators :@client, :get

  def initialize(auth_token)
    @client = HTTP.auth("Discogs #{auth_token}")
  end
end
