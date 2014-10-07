class PatientMedicationsController < ApplicationController

  def index
    @patient_medications = PatientMedication.all
  end

  def show
    @patient_medication = PatientMedication.find(params[:id])
  end

  def new
    @patient = Patient.find(session[:user_id])
    @medications = Medication.find(@patient.medication_ids)
    @patient_medication = PatientMedication.new(ongoing: true)
  end

  def edit
    @patient = Patient.find(session[:user_id])
    @medications = Medication.find(@patient.medication_ids)
    @patient_medication = PatientMedication.find(params[:id])
  end

  def create
    @patient = Patient.find(session[:user_id])
    @patient_medication = PatientMedication.new(patient_medication_params)
    if @patient_medication.save
      redirect_to patient_path(@patient.id)
    else
      render 'new'
    end
  end

  def update
    @patient = Patient.find(session[:user_id])
    @patient_medication = PatientMedication.find(params[:id])
    if @patient_medication.update_attributes(patient_medication_params)
      redirect_to patient_path(@patient.id)
    else
      render 'edit'
    end
  end

  def destroy
    PatientMedication.find(params[:id]).destroy
    redirect_to patient_path(@patient.id)
  end

  private

    def patient_medication_params
      params.require(:patient_medication).permit(:dosage, :dosage_unit, :periodicity, :periodicity_unit, :duration, :duration_unit, :ongoing, :start_date, :end_date, :instruction, :patient_id, :medication_id, :doctor_id)
    end
end
