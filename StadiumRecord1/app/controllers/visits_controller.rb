class VisitsController < ApplicationController
    get '/visits' do
      if logged_in?

        @visits = Visit.all
        @user = User.find_by(id: session[:user_id])

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
      if logged_in?
        if params[:date] == "" || params[:arena] == ""
          redirect to "/visits/new"
        else
          @visit = current_user.visits.build(params)
          if @visit.save
            redirect "/visits"
          else
            redirect "/tweets/new"
          end
        end
      else
        redirect '/visits'
      end
   end

    delete '/visits/:id/delete' do
      if logged_in?
        @visit = Visit.find_by_id(params[:id])
            if @visit && @visit.user == current_user
              @visit.delete
            end
        redirect '/visits'
      else
        redirect '/login'
      end
    end

end
