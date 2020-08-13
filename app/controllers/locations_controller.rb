class LocationsController < ApplicationController
    get '/locations' do
        redirect_if_logged_out
        @locations = Location.all
        erb :'/locations/index'
    end
    get '/locations/new' do
        @locations = Location.all
        erb :'/locations/new'
    end
    
    post '/locations' do
        @location = Location.create(params[:location])

    end
    
    get '/locations/:id/edit' do 
        @vehicle = Location.find(params[:id])
        erb :'/locations/edit'
    end
    
    get '/locations/:id' do 
        @location = Location.find(params[:id])
    end
end