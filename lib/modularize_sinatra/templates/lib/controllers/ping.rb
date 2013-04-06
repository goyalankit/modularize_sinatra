class <%= module_name %>::Controllers::Ping < Sinatra::Base
  get '/ping' do
    body "Ahoy! from <%= module_name %> #{Time.now}"
  end
end
