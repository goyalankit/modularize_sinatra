class <%= module_name %>::Controllers::<%= controller_module_name %> < Sinatra::Base

  #set view directory as /views/<%= controller_name.pluralize %> for this controller views
  set :views,  File.join(root, '../views/<%= controller_name.pluralize %>' )

  #  add your own routes TODO
  #  get '/' do
  #    erb :index
  #  end

end

