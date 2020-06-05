class VisitsController < ApplicationController
    get '/visits' do
      if logged_in?
        @visits = Visit.all
        erb :'/visits/index'
      else
        redirect '/login'
      end
    end

    get '/visits/new' do

      erb :'/visits/new'
    end

    post '/visits/new' do
      @visit = Visit.create(params)

      redirect :'/visits'
    end

end
