require './config/environment'
require './app/models/user'
require './db/data/list_of_stadiums'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "stadiumrecord_secret"
  end

  get '/' do
    if logged_in? do
      @arenas = Arena.all
      erb :'/visits/index'
    else
      @arenas = Arena.all
      erb :welcome
    end
  end

  helpers do

    #returns a boolean if the user is loggedIn or not (? means boolean return)
    def logged_in?
      !!current_user
    end

    #keeps track of the logged in user
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end
