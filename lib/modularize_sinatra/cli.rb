require 'thor'
require 'modularize_sinatra'
module ModularizeSinatra
  class CLI < Thor
    desc "new", "Create a new app"
    option :c, :default => "ping", :aliases => :C
    def new(app_name)
      app_generator = AppGenerator.new(app_name, options[:c])
      app_generator.generate
    end

    default_task :new
  end
end
