# Fubber

This is a gem to facilitate sending API requests to Followupboss.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fubber'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install fubber

## Usage

```
Fubber.api_key = 'INSERT API KEY'
Fubber.system_key = 'INSERT SYSTEM KEY'
Fubber.system = 'INSERT SYSTEM'
fub = Fubber.client
event_data = {
    source: "MyAwesomeWebsite.com",
    system: "AwesomeSiteBuilder",
    type: "General Inquiry",
    message: "Looking for a house under $500k in the East Boston area",
    person: {
        firstName: "John",
        lastName: "Smith",
        emails: [{value: "john@gmail.com"}],
        phones: [{value: "555-555-5555"}]
    }
}
response = fub.create_event(event_data)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Releasing

- Change the version in lib/fubber/version.rb
- run `bundle` which will bump the version in Gemfile.lock

To upload to Gemfury:

```
gem build fubber.gemspec -o fubber-latest.gem && fury push fubber-latest.gem --as=endrig
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fubber. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/fubber/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fubber project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fubber/blob/master/CODE_OF_CONDUCT.md).
