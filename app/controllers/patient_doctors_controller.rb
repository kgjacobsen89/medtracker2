# class PatientDoctorsController < ApplicationController

#   def index
#     @patient_doctors = PatientDoctor.all
#   end

#   def show
#   end

#   def new
#     @patient_doctor = PatientDoctor.new
#   end

#   def edit
#   end


#   def create
#     @patient_doctor = PatientDoctor.new(patient_doctor_params)

#     respond_to do |format|
#       if @patient_doctor.save
#         format.html { redirect_to @patient_doctor, notice: 'Patient doctor was successfully created.' }
#         format.json { render :show, status: :created, location: @patient_doctor }
#       else
#         format.html { render :new }
#         format.json { render json: @patient_doctor.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def update
#     respond_to do |format|
#       if @patient_doctor.update(patient_doctor_params)
#         format.html { redirect_to @patient_doctor, notice: 'Patient doctor was successfully updated.' }
#         format.json { render :show, status: :ok, location: @patient_doctor }
#       else
#         format.html { render :edit }
#         format.json { render json: @patient_doctor.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @patient_doctor.destroy
#     respond_to do |format|
#       format.html { redirect_to patient_doctors_url, notice: 'Patient doctor was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private

#     def patient_doctor_params
#       params.require(:patient_doctor).permit(:patient_id, :doctor_id)
#     end
# end
