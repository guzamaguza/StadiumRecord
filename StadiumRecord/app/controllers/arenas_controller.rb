require './config/environment'

class ArenasController < ApplicationController

    get '/arenas/index' do
      @arenas = @@arena_hash

      erb :'/arenas/index'
    end

end
