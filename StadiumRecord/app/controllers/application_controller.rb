require './config/environment'
require './app/models/user'
require './db/data/list_of_stadiums'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "stadiumrecord_secret"
    register Sinatra::Flash
  end

  get '/' do
    if logged_in?
      @user = current_user
      @arenas = @@arena_hash
      erb :'/visits/index'
    else
      @user = current_user
      @arenas = @@arena_hash
      erb :welcome
    end
  end

  get '/list_of_arenas' do
      if logged_in?
          @arenas = @@arena_hash
          erb :list_of_arenas
      else
          redirect '/'
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
