# SimpleConfiguration

SimpleConfiguration lets you write code that looks like configuration files, but keeps the dynamism that Ruby offers.

## Why?

I work on a number of applications that require configuration that can't be expressed by simple values in the database or JSON file.

While the dynamism of the configuration makes it doubtful whether it's still a configuration or it should be juts written as plain Ruby code, I decided to write this simple library that makes these files look like configration files. I personally find it more conscise and easier to read than standard Ruby methods.

When should you use it? When your classes require a lot of small methods with simple behaviour. You can check `examples/` to see how I use it.

Why not to use constants instead? Good question, I think they're good for static values, not so much for storing functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_configuration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_configuration

## Usage

Check `examples/` to see how you can use this gem.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Contribution is not only done by writing code!

If you find some problem with the gem and open an issue, if you mention it on your blog or tell your friend about it, you contribute to this gem's popularity.

Despite just a few commits, this gem is more or less complete. Having said that, if you find some issue, or have an idea on how to improve it, I'll be happy to talk to you!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleConfiguration project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arnvald/simple_configuration/blob/master/CODE_OF_CONDUCT.md).
