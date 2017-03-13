class PatientsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		@user.patient!
		@patient = Patient.new(user_id: @user.id, DOB: params[:DOB])
		@patient.save
		sign_in(@user)
		redirect_to patient_path(@patient)
	end

	def show
		@patient = current_user
	end 

	private

	def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
 	end
end
