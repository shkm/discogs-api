require 'cuba'

Cuba.define do
  def read_fixture(*path)
    File.read(['spec', 'fixtures', 'files', *path].join('/'))
  end

  on get do
    on 'database/search' do
      on param('q') do |query|
        case query
        when 'Electric Octopus'
          res.write read_fixture('search', 'artists', 'exists.json')
        end
      end
    end
  end
end
