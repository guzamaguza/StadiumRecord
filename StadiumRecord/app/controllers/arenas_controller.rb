require './config/environment'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = Arena.all

      erb :'/arenas/index'
    end

    get '/arenas/show' do
      if logged_in?
        @user = User.all.last
        @arenas = Arena.all
        erb :'/arenas/show'
      else
        redirect '/login'
      end
    end

end
