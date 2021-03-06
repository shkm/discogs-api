require 'cuba'

Cuba.define do
  def read_fixture(*path)
    File.read(['spec', 'fixtures', 'files', *path].join('/'))
  end

  def search_artist(query)
    case query
    when 'Electric Octopus'
      res.write read_fixture('search', 'artists', 'exists.json')
    end
  end

  def search_release(query)
    case query
    when 'HighKicks'
      res.write read_fixture('search', 'releases', 'exists.json')
    end
  end

  def search_master(query)
    case query
    when 'HighKicks'
      res.write read_fixture('search', 'masters', 'exists.json')
    end
  end

  def search_label(query)
    case query
    when 'Heavy Psych Sounds'
      res.write read_fixture('search', 'labels', 'exists.json')
    end
  end

  on get do
    on 'artists/:id/releases' do |id|
      res.write read_fixture('artists', id, 'releases.json')
    end

    on 'artists/:id' do |id|
      res.write read_fixture('artists', id, 'get.json')
    end

    on 'database/search' do
      on param('q'), param('type') do |query, type|
        case type
        when 'artist' then search_artist(query)
        when 'release' then search_release(query)
        when 'master' then search_master(query)
        when 'label' then search_label(query)
        end
      end
    end
  end
end

# If this file is loaded from the command line, start the server
Rack::Handler::WEBrick.run(Cuba) if $PROGRAM_NAME == __FILE__
