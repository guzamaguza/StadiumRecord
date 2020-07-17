require 'sinatra/flash'

class VisitsController < ApplicationController

    get '/visits' do
      if logged_in?

        @visits = Visit.all
        @user = User.find_by(id: session[:user_id])

        erb :'/visits/index'
      else
        redirect '/login'
      end
    end

    get '/visits/new' do
        @error_message = session[:error_message]
        @arenas = Arena.all
        erb :'/visits/new'
    end

    get '/visits/:id' do
      @visit = Visit.find_by_id(params[:id])
      @user = User.find_by(id: session[:user_id])

      erb :'/visits/show'
    end

=begin
    get '/visits/index' do
      #shows all the user's visits
      if logged_in?

        erb :'/visits/index'
      else
        redirect '/login'
      end

    end
=end


    post '/visits/new' do
      #arena and date as values
      if logged_in?
        if params[:date] == "" || params[:arena] == ""
          session[:error_message] = "You Failed to Enter in a Date or Stadium!"
          redirect to "/visits/new"
        else
          @visit = current_user.visits.build(params)
          if @visit.save
            redirect "/visits"
          else
            redirect "/visits/new"
          end
        end
      else
        redirect '/visits'
      end
   end

   get '/visits/:id/edit' do
       if logged_in?
         @visit = Visit.find_by_id(params[:id])
         if @visit && @visit.user == current_user
           @arenas = Arena.all
           erb :'/visits/edit'
         else
           redirect '/visits'
         end
       else
         redirect '/login'
       end
   end

   patch '/visits/:id' do
     if logged_in?
       if params[:date] == "" || params[:arena] == ""
         redirect "/visits/#{params[:id]}/edit"
       else
         @visit = Visit.find_by_id(params[:id])
         if @visit && @visit.user == current_user
           if @visit.update(date: params[:date]) && @visit.update(arena: params[:arena])
             redirect "/visits/#{@visit.id}"
           else
             redirect "/visits/#{@visit.id}/edit"
           end
         else
           redirect '/visits'
         end
       end
     else
       redirect to '/login'
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
