# Peek::Sidekiq

Provide a peek into the Sidekiq calls made within your Rails application.

Things this peek view provides:

- Duration spent in Sidekiq calls
- Number of calls this page created

## Installation

Add this line to your application's Gemfile:

    gem 'peek-sidekiq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-sidekiq

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::Sidekiq
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Building and deploying gem

- Update the version number in `lib/peek/sidekiq/version.rb`
- Update `CHANGELOG.md`

Build the gem:

    gem build peek-sidekiq.gemspec

Push to rubygems.org:

    gem push peek-sidekiq-1.0.3.gem

## Testing the gem locally

    gem install peek-sidekiq-1.0.3.gem


