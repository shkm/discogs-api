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
          expect(result).to have_key(:style)
          expect(result).to have_key(:thumb)
          expect(result).to have_key(:uri)
          expect(result).to have_key(:format)
          expect(result).to have_key(:country)
          expect(result).to have_key(:barcode)
          expect(result).to have_key(:user_data)
          expect(result).to have_key(:community)
          expect(result).to have_key(:label)
          expect(result).to have_key(:cover_image)
          expect(result).to have_key(:catno)
          expect(result).to have_key(:year)
          expect(result).to have_key(:genre)
          expect(result).to have_key(:title)
          expect(result).to have_key(:resource_url)
          expect(result).to have_key(:type)
          expect(result).to have_key(:id)
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

        result = results.first
        expect(result).to have_key(:style)
        expect(result).to have_key(:thumb)
        expect(result).to have_key(:uri)
        expect(result).to have_key(:format)
        expect(result).to have_key(:country)
        expect(result).to have_key(:barcode)
        expect(result).to have_key(:user_data)
        expect(result).to have_key(:community)
        expect(result).to have_key(:label)
        expect(result).to have_key(:cover_image)
        expect(result).to have_key(:catno)
        expect(result).to have_key(:year)
        expect(result).to have_key(:genre)
        expect(result).to have_key(:title)
        expect(result).to have_key(:resource_url)
        expect(result).to have_key(:type)
        expect(result).to have_key(:id)
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
