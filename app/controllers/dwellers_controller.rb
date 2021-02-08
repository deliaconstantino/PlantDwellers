require 'rack-flash'

class DwellersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/dwellers' do
    @dwellers = Dweller.all
    erb :'dwellers/index'
  end

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
      erb :'dwellers/show'
    else
      erb :'dwellers/login'
    end
  end

  post '/login' do
    dweller = Dweller.find_by(username: params[:username])&.authenticate(params[:password])
    # binding.pry
    if dweller
      session[:user_id] = dweller.id
      redirect "dwellers/#{dweller.id}"
      erb :'dwellers/show'
    else
      #flash message, please enter correct password and username
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
        #flash you don't have access to this account, please visit your own
        redirect '/login'
      end
    end
  end

  get '/logout' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      session.clear
      redirect '/'
    end
  end

  get '/dwellers/:id/edit' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      # binding.pry
      @dweller = Helpers.current_user(session)
      if params[:id].to_i == session[:user_id]
        erb :'dwellers/edit'
      else
        #flash you don't have access to this account, please visit your own
        redirect '/login'
      end
    end
  end

  patch '/dwellers/:id' do
    binding.pry
  end


end
