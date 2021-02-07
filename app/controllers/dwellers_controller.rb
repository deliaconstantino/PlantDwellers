class DwellersController < ApplicationController

  get '/dwellers' do
    @dwellers = Dweller.all
    erb :'dwellers/index'
  end

  get '/signup' do
    erb :'dwellers/signup'
  end

  post'/signup' do
    new_dweller = Dweller.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], favorite_plant: params[:favorite_plant])

    if new_dweller.save
      session[:user_id] = new_dweller.id
      redirect "/dwellers/#{new_dweller.id}"
    else
      #add flash with errors, need password, user, etc
      redirect '/dwellers/signup'
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
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      if @dweller.id == session[:user_id]
      # if Helpers.current_user(session).id == params[:id].to_i
        erb :'dwellers/show'
      else
        #flash you don't have access to this account, please visit your own
        redirect '/login'
      end
    end
  end

  get '/logout' do
  end

  get '/dwellers/edit/:id' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      if @dweller.id == session[:user_id]
        erb :'dwellers/edit'
      else
        #flash you don't have access to this account, please visit your own
        redirect '/login'
      end
    end
  end


end
