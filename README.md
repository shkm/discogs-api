# Discogs::Api

[![Build Status](https://travis-ci.org/shkm/discogs-api.svg?branch=master)](https://travis-ci.org/shkm/discogs-api)
[![codecov](https://codecov.io/gh/shkm/discogs-api/branch/master/graph/badge.svg)](https://codecov.io/gh/shkm/discogs-api)


A simple wrapper around the [Discogs API](https://www.discogs.com/developers/).

Currently heavily WIP. See [Implemented Endpoints](#user-content-implemented-endpoints)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'discogs-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install discogs-api

## Usage

```ruby
# Set up a client with your auth token and user agent
client = Discogs::Api::Client.new('my-auth-token', 'my-user-agent')

# Search for an artist
Discogs::Api::Search.artist(client, query: 'Electric Octopus')

# Search for a master
Discogs::Api::Search.master(client, query: 'This is our Culture')

# Search for an release
Discogs::Api::Search.release(client, query: 'This is our Culture')

# Search for a label
Discogs::Api::Search.label(client, query: 'Heavy Psych Sounds')

# Get an artist by its ID
Discogs::Api::Artist.get(client, 5272208)

# Get an artist's releases
Discogs::Api::Artist.releases(client, 5272208)
```

## Implemented Endpoints

- [ ] OAuth
  - [ ] GET [oauth/request_token](https://www.discogs.com/developers/#page:authentication)
  - [ ] POST [oauth/access_token](https://www.discogs.com/developers/#page:authentication)
  - [ ] GET [oauth/identify](https://www.discogs.com/developers/#page:authentication)
- [ ] Releases
  - [ ] GET [releases/:id](https://www.discogs.com/developers/#page:database,header:database-release)
  - [ ] GET [releases/:id/rating](https://www.discogs.com/developers/#page:database,header:database-community-release-rating-get)
  - [ ] GET [releases/:id/rating/:user](https://www.discogs.com/developers/#page:database,header:database-release-rating-by-user)
  - [ ] PUT [releases/:id/rating/:user](https://www.discogs.com/developers/#page:database,header:database-release-rating-by-user-put)
  - [ ] DELETE [releases/:id/rating/:user](https://www.discogs.com/developers/#page:database,header:database-release-rating-by-user-delete)
- [ ] Masters
  - [ ] GET [masters/:id](https://www.discogs.com/developers/#page:database,header:database-master-release-get)
  - [ ] GET [masters/:id/versions](https://www.discogs.com/developers/#page:database,header:database-master-release-get)
- [x] Artists
  - [x] GET [artists/:id](https://www.discogs.com/developers/#page:database,header:database-artist-get)
  - [x] GET [artists/:id/releases](https://www.discogs.com/developers/#page:database,header:database-artist-releases)
- [ ] Labels
  - [ ] GET [label/:id](https://www.discogs.com/developers/#page:database,header:database-artist-releases)
  - [ ] GET [label/:id/releases](https://www.discogs.com/developers/#page:database,header:database-all-label-releases-get)
- [x] Search
  - [x] GET [database/search](https://www.discogs.com/developers/#page:database,header:database-search-get)

There are more endpoints regarding the marketplace, user identity, user collection, user wantlists, and user lists. I'm not including those at the moment as they're out of the scope of what I want to do with this gem, but feel free to make a PR.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shkm/discogs-api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
