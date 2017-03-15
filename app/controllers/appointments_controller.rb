class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(medical_record_id: params[:medical_record_id])
	end

	def patient_input
		render '/appointments/patient_input'
	end

	def patient_submit
		@user = User.find_by(identity_card: params[:identity_card])
		if @user && @user.patient?
			session[:patient_id] = @user.patient.id
			redirect_to doctor_appointment_patient_medical_records_path(current_user.doctor)
		else
			flash[:danger] = 'Patient not found'
			redirect_to doctor_appointment_patient_input_path(current_user.doctor)
		end
	end

	def medical_record_index
		@patient = Patient.find(session[:patient_id])
		@medical_records = MedicalRecord.where(doctor_id: current_user.doctor.id, patient_id: session[:patient_id])
		render '/appointments/patient_medical_records'
	end

	def new

	end

	def create

	end
end
