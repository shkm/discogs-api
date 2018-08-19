module Discogs::Api::Search
  # def QUERY_PARAMS = %i[per_page page query type title release_title
  #                       credit artist anv label genre style country year
  #                       format catno barcode track submitter contributor]
  # def SEARCH_TYPES = %i[]
  # MAX_PER_PAGE = 100

  def execute(client, params: {})
    path = Discogs::Api::Url.resolve('database', 'search')
    client.get(path, params: params)
  end
end
