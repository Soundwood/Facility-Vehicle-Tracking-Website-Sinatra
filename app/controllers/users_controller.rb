# Needs soft failure for accessing user/account without already logging on

class UsersController < ApplicationController
    get "/user/signup" do
        erb :'/user/signup'
    end
    post "/user/signup" do
        user = User.new(:username => params[:username], :password => params[:password])
        if params[:username] == "" || params[:password] == ""
            redirect '/user/failure'
        else
            if user.save
                redirect "/user/login"
            else
                redirect "/user/failure"
            end
        end
    end
    get '/user/account' do
        @user = User.find(session[:user_id])
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
    get "/user/logout" do
        session.clear
        redirect "/"
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end
    end
end