RSpec.describe Discogs::Api::Search do
  let(:client) { Discogs::Api::Client.new('token', 'user-agent') }

  describe '.artist' do
    let(:params) { { query: 'Electric Octopus' } }

    it 'sends a search request for the artist' do
      with_fake_discogs_server do
        subject.artist(client, params)

        expect_request(:get, 'database/search', q: 'Electric Octopus', type: 'artist')
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
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
          expect(result).to have_keys %i[thumb title uri user_data cover_image
                                         resource_url type id]
        end
      end
    end
  end

  describe '.release' do
    let(:params) { { query: 'HighKicks' } }

    it 'sends a search request for the release' do
      with_fake_discogs_server do
        subject.release(client, params)

        expect_request(:get, 'database/search', q: 'HighKicks', type: 'release')
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
        response = subject.release(client, params)

        expect(response.status).to be_success
        expect(response.to_h[:pagination]).to eq(
          per_page: 50,
          items: 9,
          page: 1,
          urls: {},
          pages: 1
        )
        results = response.to_h[:results]
        expect(results.count).to eq 9

        results.each do |result|
          expect(result).to have_keys %i[style thumb uri format country barcode
                                         user_data community label cover_image catno year
                                         genre title resource_url type id]
        end
      end
    end
  end

  describe '.master' do
    let(:params) { { query: 'HighKicks' } }

    it 'sends a search request for the master' do
      with_fake_discogs_server do
        subject.master(client, params)

        expect_request(:get, 'database/search', q: 'HighKicks', type: 'master')
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
        response = subject.master(client, params)

        expect(response.status).to be_success
        expect(response.to_h[:pagination]).to eq(
          per_page: 50,
          items: 1,
          page: 1,
          urls: {},
          pages: 1
        )
        results = response.to_h[:results]
        expect(results.count).to eq 1

        expect(results.first).to have_keys %i[style thumb uri format country barcode
                                              user_data community label cover_image catno
                                              year genre title resource_url type id]
      end
    end
  end

  describe '.label' do
    let(:params) { { query: 'Heavy Psych Sounds' } }

    it 'sends a search request for the label' do
      with_fake_discogs_server do
        subject.label(client, params)

        expect_request(:get, 'database/search', q: 'Heavy Psych Sounds', type: 'label')
      end
    end

    it 'returns a successful response with expected data' do
      with_fake_discogs_server do
        response = subject.label(client, params)

        expect(response.status).to be_success
        expect(response.to_h[:pagination]).to eq(
          per_page: 50,
          items: 5,
          page: 1,
          urls: {},
          pages: 1
        )
        results = response.to_h[:results]
        expect(results.count).to eq 5

        results.each do |result|
          expect(result).to have_keys %i[thumb title uri user_data cover_image
                                         resource_url type id]
        end
      end
    end
  end
end
