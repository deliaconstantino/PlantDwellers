class HomesController < ApplicationController

  get '/homes' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      dweller = Helpers.current_user(session)
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
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      @homes = Home.all
      if @dweller.id == session[:user_id]
        erb :'homes/new'
      else
        redirect '/login'
      end
    end
  end

  post '/homes/new' do
    home = Home.new(params)
    if home.save
      dweller = Helpers.current_user(session)
      dweller.home = home
      dweller.save
      redirect "/homes/#{home.id}"
    else
      flash[:message] = "Please enter a valid home."
      redirect '/homes/new'
    end
  end

  post '/homes' do
    if !Helpers.is_logged_in?(session)
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
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      @home = Home.find(params[:id])
      if @home.dwellers.include?(@dweller)
        erb :'homes/show'
      else
        redirect '/login'
      end
    end
  end


end
