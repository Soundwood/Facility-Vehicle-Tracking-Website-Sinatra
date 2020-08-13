class LocationsController < ApplicationController
    get '/locations' do
        redirect_if_logged_out
        @locations = Location.all
        erb :'/locations/index'
    end
    get '/locations/new' do
        redirect_if_logged_out
        erb :'/locations/new'
    end
    
    post '/locations' do
        @location = Location.new(params[:location])
        if @location.save
            redirect "/locations/#{@location.id}"
        else
            redirect "/locations/failure"
        end
    end
    
    get '/locations/:id/edit' do 
        redirect_if_logged_out
        @location = Location.find(params[:id])
        erb :'/locations/edit'
    end
    
    get '/locations/:id' do 
        redirect_if_logged_out
        @location = Location.find(params[:id])
        erb :'/locations/show'
    end

    patch '/locations/:id' do 
        @location = Location.find(params[:id])
        if !params["location"]["station"].empty? && !params["location"]["building"].empty?
            @location.update(params["location"])
            redirect "/locations/#{@location.id}"
        else
            redirect "/locations/#{@location.id}"
        end
    end
end