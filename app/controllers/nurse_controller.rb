class NurseController < ApplicationController

  # SIGN UP
    get '/signup' do
      if is_logged_in?
        flash[:message] = "You were already logged in. Here are your patients."
        redirect to '/patients'
      else
        erb :'nurse/create_nurse'
      end
    end

    post '/signup' do
      if is_logged_in?
        p '\n\n NOT LOGGED IN \n\n'
        flash[:message] = "You were already logged in. Here are your patients."
        redirect to '/patients'
      elsif params[:username] == "" || params[:password] == ""
        flash[:message] = "In order to sign up for account, you must have both a username & a password. Please try again."
        redirect to '/signup'
      else
        @nurse = Nurse.create(username: params[:username], password: params[:password])
        @nurse.save
        session[:nurse_id] = @nurse.id #logged in. where is the sessions hash initially declared?
        redirect to '/patients'
      end
    end

    # LOG IN
    get '/login' do #renders the log in page
      if is_logged_in?
        flash[:message] = "You were already logged in."
        redirect '/patients'
      else
        erb :'nurse/login'
      end
    end

    post "/login" do
      @nurse = Nurse.find_by(username: params[:username]) #find the user
      if @nurse && @nurse.authenticate(params[:password]) #Authenticate with Bcrypt
        session[:nurse_id] = @nurse.id   #log nurse in
        redirect "/patients" #show patients
      else
        flash[:message] = "Your username or password were not correct. Please try again."
        redirect "/login"
      end
    end

    # Log out
    get '/logout' do
      if is_logged_in?
        session.clear
        flash[:message] = "You have been logged out of your account."
        redirect '/login'
      else
        redirect '/'
      end
  end



end
