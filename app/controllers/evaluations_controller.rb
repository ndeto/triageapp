class EvaluationsController < ApplicationController

  # GET: /evaluations
  get "/patient/:patient_id/evaluations" do
    @patient = Patient.find_by_id(params[:patient_id])
    @evaluations = @patient.evaluation.all
    erb :"/evaluations/index.html"
  end

  # GET: /patient/:patient_id/evaluations/new
  get "/patient/:patient_id/evaluations/new" do
    @patient = Patient.find_by_id(params[:patient_id])
    @categories = Category.all
    erb :"/evaluations/new.html"
  end

  # POST: /evaluations
  post "/patient/:patient_id/evaluations" do
    if params[:weight] == "" || params[:category] == "" || params[:bp] == ""  #Check all required fields
      flash[:message] = "Oops! Fill out all fields."
      redirect to '/patient/:patient_id/evaluations/new'
    else
      nurse = current_nurse
      @patient = Patient.find_by_id(params[:patient_id])
      @evaluation = @patient.evaluation.create(
          :weight => params[:weight],
          :blood_pressure => params[:bp],
          :category_id => params[:category],
          :nurse_id => nurse.id
      )
      redirect to "/patient/#{@patient.id}/evaluations"
    end
  end

  # GET: /evaluations/5
  get "/evaluations/:id" do
    erb :"/evaluations/show.html"
  end

  # GET: /evaluations/5/edit
  get "/evaluations/:id/edit" do
    erb :"/evaluations/edit.html"
  end

  # PATCH: /evaluations/5
  patch "/evaluations/:id" do
    redirect "/evaluations/:id"
  end

  # DELETE: /evaluations/5/delete
  delete "/evaluations/:id/delete" do
    redirect "/evaluations"
  end
end
