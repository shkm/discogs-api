RSpec.describe Discogs::Api::Artists do
  let(:client) { Discogs::Api::Client.new('token', 'user-agent') }
  let(:artist_id) { 5272208 }

  describe '.get' do
    it 'sends an artist request' do
      with_fake_discogs_server do
        subject.get(client, artist_id)

        expect_request(:get, "artists/#{artist_id}")
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
        response = subject.get(client, artist_id)

        expect(response.status).to be_success
        expect(response.to_h).to have_keys %i[profile releases_url name uri urls
                                              images resource_url id data_quality]
      end
    end
  end

  describe '.releases' do
    it 'sends a request for releases for the artist' do
      with_fake_discogs_server do
        subject.releases(client, artist_id)

        expect_request(:get, "artists/#{artist_id}/releases")
      end
    end
  end
end
