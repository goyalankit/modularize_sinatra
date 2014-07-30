require "active_support/inflector"
require "modularize_sinatra/version"
require "modularize_sinatra/helper_methods"
require "modularize_sinatra/app_generator"

module ModularizeSinatra
  # root of the gem
  def self.root
    File.expand_path '../..', __FILE__
  end
end
