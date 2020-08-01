require './config/environment'

class ArenasController < ApplicationController

    get '/arenas/index' do
      @user = current_user
      @arenas = @user.arenas

      erb :'arenas/index'
    end

end
