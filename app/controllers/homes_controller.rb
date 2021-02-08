class HomesController < ApplicationController

  get '/homes' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      dweller = Helpers.current_user(session)
      # binding.pry
      if !dweller.home_id.blank?
        redirect "/homes/#{dweller.home_id}"
      else
        flash[:message] = "Join a home or create a new home."
        redirect '/homes/new'
      end
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
      binding.pry
      dweller.save
      binding.pry
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
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      dweller = Helpers.current_user(session)
      home = Home.find_by(nickname: params[:nickname])
      dweller.home = home
      dweller.save
      redirect "/homes/#{home.id}"
    end
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
        redirect '/login'
      end
    end
  end


end
