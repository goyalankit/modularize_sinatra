module ModularizeSinatra
  include Helper
  require 'erb'
  class AppGenerator
    attr_accessor :app_name, :controller_name, :controller_module_name
    def initialize app_name, controller_name
      @app_name = app_name
      @controller_name = controller_name
      @controller_module_name = Helper.camelize(controller_name)
    end

    def generate
      project_root = ModularizeSinatra.root
    end
  end
end
