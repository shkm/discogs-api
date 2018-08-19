require 'forwardable'
require 'http'

class Discogs::Api::Client
  def initialize(auth_token, user_agent)
    @client = HTTP.auth("Discogs token=#{auth_token}")
              .headers(user_agent: user_agent)
  end

  def get(*args)
    Discogs::Api::Response.new(@client.get(*args))
  end
end
