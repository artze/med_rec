class DoctorsController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		@user.doctor!
		@doctor = Doctor.new(user_id: @user.id, specialization: params[:specialization])
		@doctor.save
		sign_in(@user)
		redirect_to doctor_path(@doctor)
	end

	def show
		@doctor = current_user
	end 

	private

	def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
  	end

end
