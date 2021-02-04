class DwellersController < ApplicationController

  get '/dwellers' do
    @dwellers = Dweller.all
    erb :'dwellers/index'
  end

  get '/dwellers/new' do
    erb :'dwellers/new'
  end

  post'/dwellers' do

    new_dweller = Dweller.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], favorite_plant: params[:favorite_plant])

    if new_dweller.save
      session[:user_id] = new_dweller.id
      redirect '/dwellers'
    else

      redirect '/dwellers/new'
    end

  end
end
