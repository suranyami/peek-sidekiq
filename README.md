# Glimpse::Sidekiq

Provide a glimpse into the Sidekiq calls made within your Rails application.

Things this glimpse view provides:

- Total number of Sidekiq commands called during the request
- The duration of the calls made during the request

## Installation

Add this line to your application's Gemfile:

    gem 'glimpse-sidekiq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glimpse-sidekiq

## Usage

Add the following to your `config/initializers/glimpse.rb`:

```ruby
Glimpse.into Glimpse::Views::Sidekiq
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
