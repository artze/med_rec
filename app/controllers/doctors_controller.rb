class DoctorsController < ApplicationController


	def new
		@user = User.new
		@medical_categories = MedicalCategory.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			@user.doctor!
			@doctor = Doctor.new(user_id: @user.id, specialization: params[:specialization])
			@doctor.save
			sign_in(@user)
			flash[:success] = "Doctor account successfully created!"
			redirect_to doctor_path(@doctor)
		else
			flash[:danger] = 'Input Error'
			redirect_to new_doctor_path
		end
	end

	def show
		@user = current_user
		@doctor = @user.doctor
	end 

	private

	def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
  end

end
