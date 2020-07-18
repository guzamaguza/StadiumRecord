class UsersController < ApplicationController

=begin
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
=end

  get '/signup' do
    if !logged_in?
      erb :'users/signup', locals: {message: "Please sign up before you sign in"}
    else
      redirect '/visits'
    end
  end

  post '/signup' do
    #can't use mass assignment here
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif params[:username] == User.username.each {|x| x}
      redirect to '/signup'
    else
      user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = user.id
      redirect to '/visits'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/visits'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(:password => params[:password]) #authenticate compares pwd to bcrypt salted/hashed pwd
      session[:user_id] = user.id

      redirect to "/visits"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.delete(:message)
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
