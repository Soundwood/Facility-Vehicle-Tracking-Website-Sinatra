class VehiclesController < ApplicationController
    get '/vehicles' do
        redirect_if_logged_out
        @vehicles = Vehicle.all
        erb :'/vehicles/index'
    end
    get '/vehicles/new' do
        erb :'/vehicles/new'
    end
    
    post '/vehicles' do
        @location = Vehicle.create(params[:location])
        if !params["vehicle"]["vin"].empty?
            @location.vehicle << Vehicle.create(vin: params["vehicle"]["vin"])
        end
        redirect "/owners/#{@owner.id}"
    end
    
    get '/vehicles/:id/edit' do 
        @location = Vehicle.find(params[:id])
        erb :'/vehicles/edit'
    end
    
    get '/vehicles/:id' do 
        @location = Vehicle.find(params[:id])
        erb :'/locations/show'
    end
end