require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "purplepandageneral"
  set :views, Proc.new { File.join(root, "../views/") }
  
  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "purplepandageneral"
  end
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
