module RequestHelper
  def expect_request(method, path, params)
    expect(WebMock)
      .to have_requested(method, "http://localhost:8080/#{path}")
      .with(
        query: params,
        headers: {
          'Authorization' => 'Discogs token=token',
          'User-Agent' => 'user-agent'
        }
      )
  end
end
