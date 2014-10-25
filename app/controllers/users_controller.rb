class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    if current_user
      if current_user.type == "Patient"
        redirect_to patient_path(current_user)
      else 
        redirect_to doctor_path(current_user)
      end
    else
    @user = User.new
    end
  end

 def create
    if params[:form_tag] == 'Patient'
      @user = Patient.new(user_params)
        session[:user_id] = @user.id.to_s if @user.save
        UserMailer.welcome_email(@user).deliver
        redirect_to new_patient_path(patient_id: @user.id)
    elsif params[:form_tag] == 'Doctor'
      @user = Doctor.new(user_params)
        session[:user_id] = @user.id.to_s if @user.save
        UserMailer.welcome_email(@user).deliver
        redirect_to new_doctor_path(doctor_id: @user.id)
    else
      render 'new'
    end
  end

  def show
    if !current_user
      redirect_to new_user_path
      return
    end
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else 
      render 'edit'
    end
  end

 
  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :type, :password, :password_confirmation, :first_name, :last_name, :phone_number, :sex, :date_of_birth, :blood_type, :specialty, :city, :allergies)
  end
end
