require './config/environment'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = @@arena_hash

      erb :'/arenas/index'
    end

    get '/arenas/show' do
      if logged_in?
        @user = current_user
        @arenas = @user.arenas

        erb :'/arenas/show'
      else
        redirect '/login'
      end
    end

end
