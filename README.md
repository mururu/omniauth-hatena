# Omniauth Hatena

A Strategy to auth with Hatena in OmniAuth.

Get your ConsumerKey here:http://developer.hatena.ne.jp/ja/documents/auth/apis/oauth/consumer

## Usage

Add this line to your app's `Gemfile`:

    gem 'omniauth-hatena'

And add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :hatena, "consumer_key", "consumer_secret"
    end

You can specify scope like the following

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :hatena, "consumer_key", "consumer_secret", :scope => "write_public, read_private"
    end

Regardless of what you specify, scope contains "read_public" automatically.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
