class ModularizeSinatraGenerator < RubiGen::Base

  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])

  default_options   :shebang => DEFAULT_SHEBANG,
                    :version     => '0.0.1',
                    :controller_name => 'Ping'

  attr_reader :name, :module_name, :project_name
  attr_reader :controller_name, :controller_module_name

  # extensions/option
  attr_reader :test_framework


  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @destination_root = File.expand_path(args.shift)
    @name = base_name
    @project_name = @name
    @module_name  = name.gsub('-','_').camelize
    extract_options
  end

  def manifest
    record do |m|
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      m.template_copy_each %w( Gemfile config.ru Rakefile)
      m.template "module.rb", "#{project_name}.rb"
      m.template "lib/app.rb", "lib/app.rb"
      m.template "config/environment.rb", "config/environment.rb"
      m.template "spec/spec_helper.rb", "spec/spec_helper.rb"

      #controller for app
      case controller_name
      when 'Ping'
        m.template "lib/controllers/ping.rb", "lib/controllers/ping.rb"
        m.template "spec/controllers/ping_spec.rb", "spec/controllers/ping_spec.rb"
      else
        m.template "lib/controllers/controller.rb", "lib/controllers/#{controller_name}.rb"
        m.template "spec/controllers/controller_spec.rb", "spec/controllers/controller_spec.rb"
      end

      m.dependency "install_rubigen_scripts", [destination_root, 'modularize_sinatra'], :shebang => options[:shebang], :collision => :force
    end
  end

  protected
    def banner
      <<-EOS
Creates a skeltan for modularized Sinatra Applications

USAGE: #{spec.name} name
EOS
    end

    def add_options!(opts)
      opts.separator ''
      opts.separator 'Options:'
      opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
      opts.on("-T", "--test-with=TEST_FRAMEWORK", String,
              "Select your preferred testing framework.",
              "Options: rspec (default), test_unit.") { |x| options[:test_framework] = x }
      opts.on("-C", "--controller=CONTROLLER_NAME", String,
              "Give name of your initial controller",
              "default name give is Ping.") { |x| options[:controller_name] = x }
    end

    def extract_options
      @test_framework     =  "rspec"
      @controller_name    = options[:controller_name] || "Ping"
      @controller_module_name = controller_name.gsub('-','_').camelize
    end

    BASEDIRS = %w(
      config
      lib/controllers
      public
      spec/controllers
      spec/support
      script
      tmp
    )
end
