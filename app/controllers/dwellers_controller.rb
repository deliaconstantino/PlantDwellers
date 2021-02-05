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
      redirect '/dwellers'
    else

      redirect '/dwellers/signup'
    end

  end
end
