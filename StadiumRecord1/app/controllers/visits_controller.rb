class VisitsController < ApplicationController
    get '/visits' do
      if logged_in?

        @visits = Visit.all
        #@user = User.find_by_slug(params[:slug])

        erb :'/visits/show'
      else
        redirect '/login'
      end
    end

    get '/visits/new' do
      @arenas = Arena.all
      erb :'/visits/new'
    end

    get '/visits/show' do
      #shows all the user's visits
      if logged_in?
        #@user = User.find_by_slug(params[:slug])

        erb :'/visits/show'
      else
        redirect '/login'
      end

    end

    post '/visits/new' do
      #arena and date as values
      @visit = Visit.create(params)

      redirect :'/visits'
    end

    post '/visits/:id/delete' do

    end

end
