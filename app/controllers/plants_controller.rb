class PlantsController < ApplicationController

  get '/plants' do
    @plants = Plant.all
    erb :'plants/index'
  end

  get '/plants/new' do
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      @dweller = Helpers.current_user(session)
    # binding.pry
      erb :'plants/new'
    end
  end

  post '/plants' do
    binding.pry
    if !Helpers.is_logged_in?(session)
      #add flash message here: must be logged in to see this info
      redirect '/login'
    else
      plant = Plant.new(common_name: params[:common_name], scientific_name: params[:scientific_name], category: params[:category], size: params[:size], watering_schedule: params[:watering_schedule], rotation_schedule: params[:rotation_schedule], fertilization_schedule: params[:fertilization_schedule])
      dweller = Helpers.current_user(session)
      if params[:add_to_home] == "yes"
        plant.location = params[:location]
        dweller.plants << plant
      end
      redirect '/plants'
    end
  end

  get '/plants/:id' do
    @plant = Plant.find(params[:id])
    @homes = Home.all.select do |home|
      home.plants.include?(@plant)
    end
    erb :'plants/show'
  end

  get '/plants/:id/edit' do
    #need some validation-can only edit the plants you entered
    erb :'plants/edit'
  end

end
