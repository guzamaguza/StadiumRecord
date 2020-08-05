require './config/environment'
require 'sinatra/flash'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = Arena.all

      erb :'/arenas/index'
    end

    get '/arenas/show' do
      if logged_in?
        @user = current_user
        @arenas = Arena.all

        erb :'/arenas/show'
      else
        redirect '/login'
      end
    end

end
