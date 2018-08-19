module FixturesHelper
  BASE_PATH = 'spec/fixtures/files'.freeze

  def read_fixture(*path)
    File.read [BASE_PATH, *path].join('/')
  end
end
