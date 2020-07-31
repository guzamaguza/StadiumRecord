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
        #@error_message = session[:error_message]
        @arenas = @@arena_hash
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



          new_arena = Arena.new(name: params[:arena], location: params[:location], team: params[:team])
          new_visit = {:date => params[:date], :user_id => current_user, :arena_id => new_arena.id}
          @visit = current_user.visits.build(new_visit)
          @visit.arena = new_arena
          #by saving it below it triggers validations
          if @visit.save
            flash[:success_newvisit] = "New Visit Created Successfully!"

            redirect "/visits"
          else
            flash[:error_newvisit] = "New Visit Creation Failed: #{@visit.errors.full_messages.to_sentence}"

            redirect "/visits/new"
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
           if @visit.update(date: params[:date]) && @visit.arena.update(name: params[:arena])
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
