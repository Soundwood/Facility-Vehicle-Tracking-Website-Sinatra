class LocationsController < ApplicationController
    get '/locations' do
        redirect_if_logged_out
        @locations = Location.all
        erb :'/locations/index'
    end
    get '/locations/new' do
        erb :'/locations/new'
    end
    
    post '/locations' do
        @location = Location.create(params[:location])
        if !params["vehicle"]["vin"].empty?
            @location.vehicle << Vehicle.create(vin: params["vehicle"]["vin"])
        end
        redirect "/owners/#{@owner.id}"
    end
    
    get '/locations/:id/edit' do 
        @location = Location.find(params[:id])
        erb :'/locations/edit'
    end
    
    get '/locations/:id' do 
        @location = Location.find(params[:id])
        erb :'/locations/show'
    end
end