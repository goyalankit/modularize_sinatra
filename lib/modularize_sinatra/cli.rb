require 'thor'
require 'modularize_sinatra'
module ModularizeSinatra
  class CLI < Thor
    desc "new", "Create a new app"
    option :controller_name, :default => "ping"
    def new(app_name)
      app_generator = AppGenerator.new(app_name, options[:controller_name])
      app_generator.generate
    end

    default_task :new
  end
end
