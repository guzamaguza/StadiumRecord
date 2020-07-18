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
      flash[:error_missinginfo] = "Make Sure to Fill In All Boxes to Signup!"

      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id

      if @user.save
        flash[:success_newuser] = "New User Created Successfully!"

        redirect "/visits"
      else
        flash[:error_newuser] = "New User Creation Failed: #{@user.errors.full_messages.to_sentence}"

        redirect "/signup"
      end

      redirect "/signup"
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
    if user && user.authenticate(params[:password]) #authenticate compares pwd to bcrypt salted/hashed pwd
      session[:user_id] = user.id
      flash[:success_login] = "Successfully Signed In!"

      redirect to "/visits"
    else
      flash[:error_invalidcred] = "Invalid Credentials, Try Again!"

      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      #session.delete(:message)
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
