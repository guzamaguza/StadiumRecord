require './config/environment'
require './app/models/user'
require './db/data/list_of_stadiums'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "stadiumrecord_secret"
    register Sinatra::Flash
  end

  get '/' do
    @arenas = Arena.all

    erb :welcome
  end

  get '/list_of_arenas' do
    @arenas = Arena.all

    erb :'list_of_arenas'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end
