class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctors = Doctor.find(@patient.doctor_ids)
  end

  def new
    @patient = Patient.find(params[:patient_id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save 
      #find doctors_ids in patient, then look up doctors based on doctor id, then add patient.id to a patient list in doctors model
      redirect_to patient_path
    else 
      render 'new' 
    end  
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      redirect_to patient_path
    else 
      render 'edit'
    end
  end

  def destroy
    Patient.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :phone_number, :sex, :date_of_birth, :blood_type, :medication_ids => [], :doctor_ids => [] )
    end
end
