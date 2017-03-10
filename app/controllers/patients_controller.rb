class PatientsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		byebug
		@user = User.new(user_params)
		@user.save
		@patient = Patient.new(user_id: @user.id)
		@patient.save
	end

	private

	def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
  end
end
