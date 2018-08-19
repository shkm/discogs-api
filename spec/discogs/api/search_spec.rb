RSpec.describe Discogs::Api::Search do
  let(:client) { Discogs::Api::Client.new('token', 'user-agent') }

  describe '.artist' do
    it 'sends a search request for the artist' do
      with_fake_discogs_server do
        params = { query: 'Electric Octopus' }
        subject.artist(client, params)

        expect_request(:get, 'database/search', q: 'Electric Octopus', type: 'artist')
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
        params = { query: 'Electric Octopus' }

        response = subject.artist(client, params)

        expect(response.status).to be_success
        expect(response.to_h[:pagination]).to eq(
          per_page: 50,
          items: 4,
          page: 1,
          urls: {},
          pages: 1
        )
        results = response.to_h[:results]
        expect(results.count).to eq 4

        results.each do |result|
          expect(result).to have_key(:thumb)
          expect(result).to have_key(:title)
          expect(result).to have_key(:uri)
          expect(result).to have_key(:user_data)
          expect(result).to have_key(:cover_image)
          expect(result).to have_key(:resource_url)
          expect(result).to have_key(:type)
          expect(result).to have_key(:id)
        end
      end
    end
  end
end
