class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
  end

  def create
  @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path
    else
      render 'new'
    end
  end


  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      redirect_to doctor_path
    else
      render 'edit'
    end
  end

  def destroy
    Doctor.find(params[:id]).destroy
    redirect_to root_path
  end

  private 

  def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :speciality, :phone_number, :city)
  end
  
end
