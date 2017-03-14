class MedicalRecordsController < ApplicationController

	def index
		@patient = current_user
		@medical_records = MedicalRecord.where(patient_id: current_user.patient.id)
	end 

	# def new 
	# 	# if else for user roles
	# 	@medicalrecord = MedicalRecord.new
	# end 

	# def create
	# 	@medicalrecord = MedicalRecord.new(mr_params)
	# 	if @medicalrecord.save!
	# 		#redirect to MR#show
	# 	else 
	# 		#redirect to MR#new
	# 	end 
	# end 

	def show 
		@patient = current_user
		@medicalrecord = MedicalRecord.find_by(id: params[:id])
	end

	def patient_input
		render '/medical_records/new_mr_patient_input'
	end

	def patient_submit
		@user = User.find_by(identity_card: params[:identity_card])
		if @user && @user.patient?
			session[:patient_id] = @user.patient.id
			redirect_to doctor_MR_input_path
		else
			render text: 'error'
		end
	end

	def record_input
		#medical record input form, medical conditions etc.
		@user = Patient.find(session[:patient_id]).user
		@medical_conditions = MedicalCondition.all
		@medical_categories = MedicalCategory.all
		render 'medical_records/new_mr_form'
	end

	def record_submit
		@medical_record = MedicalRecord.new(patient_id: session[:patient_id], doctor_id: params[:doctor_id], medical_condition_id: params[:medical_condition], medical_category_id: params[:medical_category])
		@medical_record.save

		@appointment = Appointment.new(medical_record_id: @medical_record.id, appointment_date: params[:appointment_date], notes: params[:notes])
		@appointment.save

		session[:medical_record_id] = @medical_record.id
		session[:appointment_id] = @appointment.id
		redirect_to doctor_medications_input_path(params[:doctor_id])
	end

	private

	# def mr_params
	# 	params[:medical_records].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
 #  	end
end

#  patient_id: nil, doctor_id: nil, medical_condition_id: nil, medical_category_id: nil, created_at: nil, updated_at: nil>
# irb(main):002: