require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
  end

  get "/" do
    if Helpers.is_logged_in?(session)
      redirect '/login'
    else
      erb :welcome
    end
  end

end
