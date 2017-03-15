class PatientsController < ApplicationController
	def new
		@user = User.new
		@user.build_patient
	end

	def create
		@user = User.new(user_params)
		if @user.save
			@user.patient!
			sign_in(@user)
			flash[:success] = "Patient account successfully created!"
			redirect_to patient_path(@user.patient)
		else
			flash[:danger] = 'Input Error'
			redirect_to new_patient_path
		end
	end

	def show
		@user = current_user
		@patient = @user.patient
	end 

	private

	def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address, :postcode, :city, :country, :contact_number, patient_attributes: [:date_of_birth, :gender, :height, :weight, :blood_type])
 	end
end
