class MedicationsController < ApplicationController

  def index
    # @pillbox = Pillboxr.ingredient(:caffeine).image(true)
    @medications = Medication.all
  end

  def show
    @medication = Medication.find(params[:id])
    @drugs = HTTParty.get("http://rxnav.nlm.nih.gov/REST/drugs?name=#{@medication.name}")
  end

  def new
    @medication = Medication.new
    @patient = Patient.find(session[:user_id])
    
  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save 
      redirect_to new_patient_medication_path
    else 
      render 'new' 
    end  
  end

  def destroy
    @medication = Medication.find(params[:id]).destroy 
    redirect_to medications_path
  end

  private
  
    def medication_params
      params.require(:medication).permit(:name)
    end
end
