class VehiclesController < ApplicationController
    get '/vehicles' do
        redirect_if_logged_out
        @vehicles = Vehicle.all
        @locations = Location.all
        erb :'/vehicles/index'
    end
    get '/vehicles/new' do
        @vehicle = Vehicle.new()
        @locations = Location.all 
        redirect_if_logged_out
        erb :'/vehicles/new'
    end
    
    post '/vehicles' do
        @user = current_user
        @vehicle = Vehicle.new(:vin => params[:vehicle][:vin],:model => params[:vehicle][:model],:sub_model => params[:vehicle][:sub_model],
        :location_id => params[:vehicle][:location_id], :user_id => @user.id)
        if @vehicle.save
            redirect "/vehicles/#{@vehicle.id}"
        else
            flash[:errors] = "Vehicle creation failure: #{@vehicle.errors.full_messages.to_sentence}."
            redirect "/vehicles/new"
        end
    end
    
    get '/vehicles/:id/edit' do
        redirect_if_logged_out
        @vehicle = Vehicle.find(params[:id])
        @locations = Location.all
        redirect_if_unauth_user(@vehicle.user_id)
        erb :'/vehicles/edit'
    end
    get '/vehicles/unauth_for_vehicle' do
        erb :'/vehicles/unauth_access'
    end
    get '/vehicles/:id' do 
        redirect_if_logged_out
        @vehicle = Vehicle.find(params[:id])
        redirect_if_unauth_user(@vehicle.user_id)
        erb :'/vehicles/show'
    end
    patch '/vehicles/:id' do 
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.update(params["vehicle"])
            redirect "/vehicles/#{@vehicle.id}"
        else
            flash[:errors] = "Vehicle update failure: #{@vehicle.errors.full_messages.to_sentence}."
            redirect "/vehicles/#{@vehicle.id}"
        end
    end
    helpers do 
        def redirect_if_unauth_user(user_id)
            redirect to '/vehicles/unauth_for_vehicle' unless current_user.id == user_id
        end
    end
end