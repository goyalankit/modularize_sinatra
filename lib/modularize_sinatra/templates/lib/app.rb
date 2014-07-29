module <%= module_name %>
  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..')
    set :vendor, 'FIX add your vendor name'

    use <%= module_name %>::Controllers::<%= controller_module_name %>
  end
end

