require './config/environment'
require 'sinatra/flash'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = Arena.all

      erb :'/arenas/index'
    end

    get '/arenas/index' do
      if logged_in?
        @user = current_user
        @arenas = @user.arenas.all
        @uniq_arenas = Arena.all

        erb :'arenas/index'
      else
        redirect '/login'
      end
    end

end
