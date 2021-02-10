class PlantsController < ApplicationController

  get '/plants' do
    @plants = Plant.all
    erb :'plants/index'
  end

  get '/plants/new' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
      erb :'plants/new'
    end
  end

  post '/plants' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      plant = Plant.create(
        common_name: params[:common_name],
        scientific_name: params[:scientific_name],
        category: params[:category],
        size: params[:size],
        watering_schedule: params[:watering_schedule],
        rotation_schedule: params[:rotation_schedule],
        fertilization_schedule: params[:fertilization_schedule]
      )
      dweller = Helpers.current_user(session)
      if params[:add_to_home] == "yes"
        plant.location = params[:location]
        dweller.plants << plant
      end
      redirect "/plants/#{plant.id}"
    end
  end

  get '/plants/:id' do
    @dweller = Helpers.current_user(session)
    @plant = Plant.find(params[:id])
    @homes = Home.all.select do |home|
      home.plants.include?(@plant)
    end
    erb :'plants/show'
  end

  get '/plants/:id/edit' do
    @plant = Plant.find(params[:id])

    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      if Helpers.current_user(session).plants.include?(@plant)
        erb :'plants/edit'
      else
        redirect '/plants'
      end
    end
  end

  patch '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.update(common_name: params[:common_name], scientific_name: params[:scientific_name], category: params[:category], size: params[:size], watering_schedule: params[:watering_schedule], rotation_schedule: params[:rotation_schedule], fertilization_schedule: params[:fertilization_schedule])
    redirect "/plants/#{plant.id}"
  end

  delete '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.destroy
    redirect '/plants'
  end


end
