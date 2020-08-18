class UsersController < ApplicationController
    get "/user/signup" do
        erb :'/user/signup'
    end
    post "/user/signup" do
        user = User.new(:username => params[:username], :password => params[:password])
        if params[:username] == "" || params[:password] == ""
            redirect '/user/failure'
        elsif User.find_by(:username => params[:username])
            redirect '/user/already_exists'
        else
            if user.save
                redirect "/user/login"
            else
                redirect "/user/failure"
            end
        end
    end
    get '/user/account' do
        redirect_if_logged_out
        @user = User.find_by(:id => session[:user_id])
        @vehicles = Vehicle.all
        @locations = Location.all
        erb :'/user/account'
    end
    get "/user/login" do
        erb :'/user/login'
    end
    post "/user/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/user/account"
        else
            redirect "/user/failure"
        end
    end
    get "/user/failure" do
        erb :'/user/failure'
    end
    get "/user/already_exists" do
        erb :'/user/already_exists'
    end
    get "/user/logout" do
        session.clear
        redirect "/"
    end
    delete "/user/:id" do
        User.destroy(params[:id])
        redirect to "/"
    end
end