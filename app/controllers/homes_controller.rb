class HomesController < ApplicationController

  get '/homes' do
    @homes = Home.all
    erb :'homes/index'
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
    home = Home.new(params)
    if home.save
      dweller
    # binding.pry
    end
  end


end
