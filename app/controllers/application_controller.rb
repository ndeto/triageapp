require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  # enable sessions
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'triage_app'
    register Sinatra::Flash
  end

  # Homepage
  get '/' do
    erb :index
  end

  def is_logged_in?
    !!session[:nurse_id]
  end

  def current_nurse
    @nurse = Nurse.find(session[:nurse_id])
  end
end
