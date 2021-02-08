class HomesController < ApplicationController

  get '/homes' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @homes = Home.all
      erb :'homes/index'
    end
  end

  get '/homes/new' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      @homes = Home.all
      if @dweller.id == session[:user_id]
      # if Helpers.current_user(session).id == params[:id].to_i
        erb :'homes/new'
      else
        #flash you don't have access to this account, please visit your own
        redirect '/login'
      end
    end
  end

  post '/homes/new' do
    # binding.pry
    home = Home.new(params)
    if home.save
      dweller = Helpers.current_user(session)
      dweller.home = home
      redirect "/homes/#{home.id}"
    else
      flash[:message] = "Please enter a valid home."
      redirect '/homes/new'
    end
  end

  get '/homes/:id/edit' do
    erb :'homes/edit'
  end

  post '/homes' do
    binding.pry
    params
  end

  get '/homes/:id' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      @home = Home.find(params[:id])
      if @home.dwellers.include?(@dweller)
      # if Helpers.current_user(session).id == params[:id].to_i
        erb :'homes/show'
      else
        #flash you don't have access to this account, please visit your own
        redirect '/homes'
      end
    end
  end


end
