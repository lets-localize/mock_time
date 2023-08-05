# MockTime

MockTime makes it easy to run your app (in development environment) at any point in time!

## Installation

Add the gem to your gemfile in the development group:

```ruby
# Gemfile

group :development do
  ...
  gem "mock_time"
  ...
end
```

Bundle install:

```console
$ bundle
```

There is an initializer, but I suggest you use ENV vars until you really see the need.

```console
$ bin/rails g mock_time:install
```

There are two settings: `enabled` and `mock_time`.

## Usage

MockTime essentially overrides `Time.now` with `mock_time`. You can use Rails' convenience methods to generate your `mock_time`.

In the initializer:

```ruby
MockTime.configure do |config|
  config.enabled = true
  config.mock_time = -3.hours
end
```

If you pass `MOCK_TIME` as an `ENV` variable, `enabled` is automatically considered `true`.

```console
$ MOCK_TIME="-3.days" bin/rails c
Loading development environment (Rails 6.1.7.4)
[1] app@development:pry (main)> Time.current
=> Wed, 02 Aug 2023 03:53:15.722055000 UTC +00:00
```

(You'll have to trust me that it is Aug 05 at the time of this writing)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lets_localize/mock_time. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lets_localize/mock_time/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MockTime project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lets_localize/mock_time/blob/main/CODE_OF_CONDUCT.md).
