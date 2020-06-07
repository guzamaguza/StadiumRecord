class VisitsController < ApplicationController
    get '/visits' do
      if logged_in?
        @visits = Visits.all

        erb :'/visits/index'
      else
        redirect '/login'
      end
    end

    get '/visits/new' do
      @arenas = Arena.all
      erb :'/visits/new'
    end

    post '/visits/new' do
      #arena and date as values
      @visit = Visit.create(params)

      redirect :'/visits'
    end

    post '/delete' do

    end

end
