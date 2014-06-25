# Modularize Sinatra

[![Gem Version](https://badge.fury.io/rb/modularize_sinatra.png)](http://badge.fury.io/rb/modularize_sinatra)

Modularized Code Generator for Sinatra. Gem available on [rubygems](https://rubygems.org/gems/modularize_sinatra)
More information at: http://goyalankit.com/blog/2013/07/23/modularize-sinatra/

## Installation

    $ gem install modularize_sinatra

## Usage

To generate the skeleton structure with custom controller:

    modularize_sinatra myapp -C user

To Start the app:
    
    rackup -p 9292

It will generate a default index page for you, which can be accessed at:
    
    http://localhost:9292/

You'll get the following directory structure with above command:

    .
    |-- Gemfile
    |-- Rakefile
    |-- config
    |   `-- environment.rb
    |-- config.ru
    |-- lib
    |   |-- app.rb
    |   |-- controllers
    |   |   `-- user.rb
    |   `-- views
    |       `-- users
    |           `-- index.erb
    |-- myapp.rb
    |-- public
    |-- script
    |-- spec
    |   |-- controllers
    |   |   `-- user_spec.rb
    |   |-- spec_helper.rb
    |   `-- support
    `-- tmp

Without the `-C` paramter( **not recommended** ), it will generate a default controller for you called `Ping` and will create the following route:

    GET http://localhost:9292/ping
    > Ahoy! from Myapp 2013-04-07 00:33:58 +0530

Currently `rspec` is configured by default. Hope to release support for other frameworks in future versions.

To Run specs:

    bundle exec rake 
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

