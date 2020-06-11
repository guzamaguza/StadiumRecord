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
    #create arena objects on welcoming user (no seeding necessary)
    @@arena_hash.each_with_index do |arena, index|
        Arena.new(arena[1])
    end

    erb :welcome
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
