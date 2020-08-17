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
        @user = current_user
        @location = Location.new(:station => params[:location][:station],:building => params[:location][:building], :user_id => @user.id)
        if @location.save
            redirect "/locations/#{@location.id}"
        else
            redirect "/locations/failure"
        end
    end
    
    get '/locations/:id/edit' do 
        redirect_if_logged_out
        @location = Location.find(params[:id])
        redirect_if_unauth_user(@location.user_id)
        erb :'/locations/edit'
    end
    get '/locations/unauth_for_location' do
        erb :'/locations/unauth_access'
    end
    get '/locations/:id' do 
        redirect_if_logged_out
        @location = Location.find(params[:id])
        redirect_if_unauth_user(@location.user_id)
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
    helpers do 
        def redirect_if_unauth_user(user_id)
            redirect to '/locations/unauth_for_location' unless current_user.id == user_id
        end
    end
end