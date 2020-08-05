require 'sinatra/flash'

class VisitsController < ApplicationController

    get '/visits' do
      if logged_in?

        @visits = Visit.all
        @user = current_user

        erb :'/visits/show'
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
        @user = current_user

        erb :'/visits/show'
      end

      post '/visits/new' do
        #arena and date as values
        if logged_in?
            new_visit = {:date => params[:date], :user_id => current_user, :arena_id => params[:arena_id]}
            @visit = current_user.visits.build(new_visit)

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
              @user = current_user
              @arenas = @user.arenas.all
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
          if params[:date] == "" || params[:arena_id] == ""
            redirect "/visits/#{params[:id]}/edit"
          else
            @visit = Visit.find_by_id(params[:id])
            if @visit && @visit.user == current_user
              if @visit.update(date: params[:date]) && @visit.arena.update(arena_id: params[:arena_id])
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
