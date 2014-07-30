module ModularizeSinatra
  require 'erubis'
  class AppGenerator
    attr_accessor :app_name, :controller_name, :controller_module_name, :module_name, :app_root, :test_framework
    def initialize app_name, controller_name
      @app_name = app_name
      @controller_name = controller_name
      @controller_module_name = controller_name.camelize
      @module_name = app_name.camelize
      @templates_path = File.join(File.expand_path(File.dirname(__FILE__)), 'templates')
      @test_framework = "rspec"
    end

    def full_path destination
      File.join(@app_root, destination)
    end

    def add_file source, destination
      destination_path = full_path(destination)
      input = File.read(File.join(@templates_path, source))
      eruby = Erubis::Eruby.new(input)
      
      already_exists = false
      overwrite = true

      if File.exists?(destination_path)
        print "File #{destination_path} already exists. Overwrite(Y/n)? "
        user_says = STDIN.gets.chomp
        overwrite = false unless user_says.downcase == 'y'
        already_exists = true
      end

      if overwrite
        puts "#{already_exists ? 'overwriting' : 'creating'}" << " #{destination_path}"
        File.open(destination_path, 'w') { |file| file.write(eruby.result(binding())) }
      else
        puts "skipping #{destination_path}"
      end

    end

    # this method adds directory w.r.t root path of the app
    def add_dir destination
      destination_path = full_path(destination)
      Dir.mkdir(destination_path) unless Dir.exists?(destination_path)
      puts "creating directory #{@app_name}/#{destination}"
    end

    def create_app_dir
      Dir.mkdir(@app_name) unless Dir.exists?(@app_name)
      @app_root = File.join(Dir.pwd, @app_name)
    end

    def generate
      # generate root directory
      create_app_dir

      # create all directories
      # order is important here
      dirs = [
        "config", 
        "lib", 
        "lib/controllers", 
        "lib/views", 
        "spec", 
        "spec/controllers"
      ]

      # if controller is not default
      if @controller_name != "ping"
        dirs << "lib/views/#{@controller_name.pluralize}"
      end

      dirs.each do |dir|
        add_dir(dir)
      end

      # create all files
      files = {
        "config/environment.rb" => "config/environment.rb",
        "lib/app.rb" => "lib/app.rb",
        "spec/spec_helper.rb" => "spec/spec_helper.rb",
        "config.ru" => "config.ru",
        "Gemfile" => "Gemfile",
        "module.rb" => "#{@app_name}.rb",
        "Rakefile" => "Rakefile"
      }

      # add default ping controller
      if @controller_name == "ping"
        files["lib/controllers/ping.rb"] = "lib/controllers/ping.rb"
        files["spec/controllers/ping_spec.rb"] = "spec/controllers/ping_spec.rb"
      else
        files["lib/controllers/controller.rb"] = "lib/controllers/#{@controller_name}.rb"
        files["lib/views/index.erb"] = "lib/views/#{@controller_name.pluralize}/index.erb"
        files["spec/controllers/controller_spec.rb"] = "spec/controllers/#{@controller_name}_spec.rb"
      end

      files.each do |src, dest|
        add_file src, dest
      end
    end
  end
end
