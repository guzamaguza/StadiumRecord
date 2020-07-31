require './config/environment'

class ArenasController < ApplicationController

    get '/arenas' do
      @arenas = @@arena_hash

      erb :'/arenas/index'
    end

    get '/arenas/show' do
      if logged_in?
        @user = User.all.last
        @visited_arenas = []
        @user.visits.each do |visit|
            @visited_arenas << visit.arena
        end

        @arenas = @@arena_hash
        erb :'/arenas/show'
      else
        redirect '/login'
      end
    end

end
