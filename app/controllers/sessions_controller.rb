class SessionsController < ApplicationController
	def new
	# Present an empty login form
	@user = User.new
		if current_user
	      if @user.type == "Patient"
	        redirect_to patient_path(@user.id)
	      else 
	        redirect_to doctor_path(@user.id)
	      end
	    end
	end

	def create
		# Find the user that is trying to log in		
		@user = User.where(email: params[:user][:email]).first
		if @user && @user.authenticate(params[:user][:password])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			session[:user_id] = @user.id.to_s
			if @user._type == 'Patient'
				redirect_to patient_path(@user.id)
			elsif @user._type == 'Doctor'
				redirect_to doctor_path(@user.id)
			end
		else
			# Go back to the login page
			redirect_to new_session_path
		end
	end


	def destroy
		reset_session
		redirect_to new_user_path
	end
end
