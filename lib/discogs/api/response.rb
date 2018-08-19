# Simple wrapper around a HTTP::Response to easily parse JSON
class Discogs::Api::Response < SimpleDelegator
  def to_h
    JSON.parse(to_s, symbolize_names: true)
  end
end
