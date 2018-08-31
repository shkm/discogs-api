RSpec.describe Discogs::Api::Artists do
  around(:all) { |example| with_fake_discogs_server(example) }

  let(:client) { Discogs::Api::Client.new('token', 'user-agent') }
  let(:artist_id) { 5272208 }

  describe '.get' do
    it 'sends an artist request' do
      subject.get(client, artist_id)

      expect_request(:get, "artists/#{artist_id}")
    end

    it 'returns a successful response with expected data' do
      response = subject.get(client, artist_id)

      expect(response.status).to be_success
      expect(response.to_h).to have_keys %i[profile releases_url name uri urls
                                            images resource_url id data_quality]
    end
  end

  describe '.releases' do
    it 'sends a request for releases for the artist' do
      subject.releases(client, artist_id)

      expect_request(:get, "artists/#{artist_id}/releases")
    end
  end

  it 'returns a successful response with expected data' do
    response = subject.releases(client, artist_id)

    expect(response.status).to be_success
    expect(response.to_h[:pagination]).to eq(
      per_page: 50,
      items: 3,
      page: 1,
      urls: {},
      pages: 1
    )
    releases = response.to_h[:releases]

    expect(releases.count).to eq 3

    releases.each do |release|
      # there are a bunch of optional keys here. Just testing what each release
      # has in our test.
      expect(release).to have_keys %i[stats title thumb role year resource_url artist
                                      type id]
    end
  end
end
