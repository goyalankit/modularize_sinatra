# Modularize Sinatra

Modularized Code Generator for Sinatra. Gem available on [rubygems](https://rubygems.org/gems/modularize_sinatra)

## Installation

    $ gem install modularize_sinatra

## Usage

To generate the skeleton structure:

    modularize_sinatra myapp

Without any paramters, it will generate a default controller for you called `Ping` and will create the following route:

    GET http://localhost:9292/ping
    > Ahoy! from Myapp 2013-04-07 00:33:58 +0530

You can create a custome controller by giving `-C` option.

    modularize_sinatra myapp -C awesome_controller    

**You can remove the defult scripts`destroy, generate` generated in script folder.**
  

You'll get the following directory structure with defaults:

    .
    |-- Gemfile
    |-- Rakefile
    |-- config
    |   `-- environment.rb
    |-- config.ru
    |-- lib
    |   |-- app.rb
    |   `-- controllers
    |       `-- ping.rb
    |-- myapp.rb
    |-- public
    |-- script
    |   |-- destroy
    |   `-- generate
    |-- spec
    |   |-- controllers
    |   |   `-- ping_spec.rb
    |   |-- spec_helper.rb
    |   `-- support
    `-- tmp


To Start the app:
    
    rackup -p 9000

Currently `rspec` is configured by default. Hope to release support for other frameworks in future versions.

To Run specs:

    bundle exec rake 
    
## TODO

1. Support for active record.
2. More testing frameworks.
3. Views(the missing link - MVC).
3. Remove default scripts generated.
4. Refactoring 
    
## Authors

**Ankit Goyal**
 * [about.me](http://about.me/goyalankit)
 * [@_goyalankit](http://twitter.com/_goyalankit)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
