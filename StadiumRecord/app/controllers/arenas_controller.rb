require './config/environment'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = Arena.all

      erb :'/arenas/index'
    end

    get '/arenas/show' do
      if logged_in?
        @user = User.all.last
        @visited_arenas = []
        @user.visits.each do |visit|
            @visited_arenas << visit.arena
        end

        @arenas = Arena.all
        erb :'/arenas/show'
      else
        redirect '/login'
      end
    end

end
