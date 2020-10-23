# Jpfs - Japan Prefecture Fuzzy Searcher

Search Japan prefecture based on [geojson](https://github.com/dataofjapan/land/blob/c686f194db009794b63b38585af060fbe1b0b304/japan.geojson)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jpfs'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jpfs

## Usage

```rb
Jpfs.search(latitude: 35.7100069, longitude: 139.8108103)
=> #<Jpfs::Prefecture @id=13 @english="Tokyo To" @japanese="東京都">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mizoR/jpfs.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
