RSpec.describe Discogs::Api::Url do
  describe '.resolve' do
    context 'with no arguments' do
      it 'returns the base URL' do
        expect(subject.resolve).to eq 'https://api.discogs.com'
      end
    end

    context 'with arguments' do
      it 'adds those arguments to the path' do
        expect(subject.resolve('foo', 'bar')).to eq 'https://api.discogs.com/foo/bar'
      end
    end
  end
end
