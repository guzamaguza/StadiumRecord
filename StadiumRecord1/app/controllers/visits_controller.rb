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
      #get visit stadium, date, user_id and make a new visit
      @visit = Visit.create(params)
      #stadium
      #date

      redirect :'/visits'
    end

end
