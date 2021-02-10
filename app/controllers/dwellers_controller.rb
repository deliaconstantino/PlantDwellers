require 'rack-flash'

class DwellersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/signup' do
    erb :'dwellers/signup'
  end

  post'/signup' do
    new_dweller = Dweller.new(params)

    if new_dweller.save
      session[:user_id] = new_dweller.id
      redirect "/dwellers/#{new_dweller.id}"
    else
      flash[:message] = ["Please enter unique information:"]
      new_dweller.errors.each do |key, value|
        flash[:message] << "#{key} #{value}"
      end
      redirect '/signup'
    end
  end

  get '/login' do
    if  Helpers.is_logged_in?(session)
      @dweller = Helpers.current_user(session)
      redirect "/dwellers/#{@dweller.id}"
    else
      erb :'dwellers/login'
    end
  end

  post '/login' do
    dweller = Dweller.find_by(username: params[:username])&.authenticate(params[:password])
    if dweller
      session[:user_id] = dweller.id
      redirect "dwellers/#{dweller.id}"
    else
      flash[:message] = "Please enter correct username and password."
      redirect '/login'
    end

  end

  get '/dwellers/:id' do
    if !Helpers.is_logged_in?(session)
      flash[:message] = "Please log in to see your account."
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      if @dweller.id == session[:user_id]
        erb :'dwellers/show'
      else
        redirect '/login'
      end
    end
  end

  get '/logout' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      session.clear
      redirect '/'
    end
  end
end
