# Spine::Http

[![Gem Version](https://badge.fury.io/rb/spine-http.svg)](http://badge.fury.io/rb/spine-http)
[![Dependency Status](https://gemnasium.com/rspine/http.svg)](https://gemnasium.com/rspine/http)
[![Code Climate](https://codeclimate.com/github/rspine/http/badges/gpa.svg)](https://codeclimate.com/github/rspine/http)

Wrapper for `Net::Http` to make requests easier.

## Installation

To install it, add the gem to your Gemfile:

```ruby
gem 'spine-http'
```

Then run `bundle`. If you're not using Bundler, just `gem install spine-http`.

## Usage

```ruby
response = Spine::Http::Request.new('https://api.example.com/me')
  .header('Authorization', 'Bearer 123')
  .query(include_examples: true)
  .get

response.body(Spine::ContentTypes::Json)
# => { id: 1, name: 'Myself' }

response = Spine::Http::Request.new('https://api.example.com/me')
  .header('Authorization', 'Bearer 123')
  .payload(name: 'Me')
  .post

response.code
# => 200
response.is?(Net::HTTPSuccess)
# => true
```
