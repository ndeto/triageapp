class PatientsController < ApplicationController

  # GET: /patients
  get "/patients" do
    if is_logged_in?
      @nurse = current_nurse
      @patients = @nurse.patient.all
      erb :'patients/index'
    else
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  # GET: /patients/new
  get "/patients/new" do
    erb :"/patients/new"
  end

  # POST: /patients
  post "/patients" do
    if params[:fname] == "" || params[:lname] == "" || params[:phone] == "" || params[:username] == "" #Check all required fields
      flash[:message] = "Oops! Fill out all fields."
      redirect to '/patients/new'
    else
      nurse = current_nurse
      @patient = Patient.create(
          :fname => params[:fname],
          :lname => params[:lname],
          :phone => params[:phone],
          :username => params[:username],
          :nurse_id => nurse.id
      )
      redirect to "/patients/#{@patient.id}"
    end
  end

  # GET: /patients/5
  get "/patients/:id" do
    if is_logged_in?
      @patient = Patient.find_by_id(params[:id])
        erb :'patients/show'
    else
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/patients'
    end
  end

  # Update
  get '/patients/:id/edit' do
    if is_logged_in?
      @patient = Patient.find_by_id(params[:id])
        erb :'patients/edit'
    else
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  post '/patient/:id' do
    if params[:fname] == "" || params[:lname] == "" || params[:phone] == "" || params[:username] == ""
      flash[:message] = "Oops! You must fill all the fields. Please try again."
      redirect to "/patients/#{params[:id]}/edit"
    else
      @patient = Patient.find_by_id(params[:id])
      @patient.fname = params[:fname]
      @patient.lname = params[:lname]
      @patient.username = params[:username]
      @patient.phone = params[:phone]
      @patient.nurse_id = current_nurse.id
      @patient.save
      flash[:messsage] = "Patient has been updated!"
      redirect to "/patients/#{@patient.id}"
    end
  end


  # DELETE: /patients/5/delete
  delete "/patients/:id/delete" do
    if is_logged_in?
      @patient = Patient.find_by_id(params[:id])
      if @patient.nurse_id == session[:nurse_id]
        @patient.delete
        flash[:message] = "The patient was deleted."
        redirect to '/patients'
      end
    else
      flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end
end
