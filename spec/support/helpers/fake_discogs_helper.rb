module FakeDiscogsHelper
  def with_fake_discogs_server(&block)
    stub_const('Discogs::Api::Url::BASE_URL', 'http://localhost:8080')

    yield
  end
end
