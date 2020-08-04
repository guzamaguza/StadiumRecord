require './config/environment'

class ArenasController < ApplicationController

    get '/arenas/index' do
      @user = current_user
      @arenas = @user.arenas

      @arena_arr = []
      @arenas.each do |x|
        @arena_arr << x.name
      end

      @arena_uniq_hash = {}
      @uniq_arenas = @arena_arr.uniq
      @@arena_hash.each_with_index do |value, index|
        @uniq_arenas.each do |aren|
          if aren == value[1][:name]
            @arena_uniq_hash[:"#{aren}"] = value[1]
          end
        end
      end

      erb :'arenas/index'
    end

end
