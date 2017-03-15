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
		@patient = Patient.find(session[:patient_id])
		@medical_record = MedicalRecord.find(params[:medical_record_id])
		@appointment = Appointment.new
	end

	def create
		session[:appoinment_id] = nil
		@appointment = MedicalRecord.find(params[:medical_record_id]).appointments.new(appointment_params)
		if @appointment.save
			session[:appointment_id] = @appointment.id
			flash[:success] = 'Appointment record created'
			redirect_to medical_record_appointment_medications_input_path(params[:medical_record_id])
		else
			flash[:danger] = 'Appointment creation failed'
			redirect_to medical_record_new_appointment_path(params[:medical_record_id])
		end
	end

	def medication_input
		@patient = Patient.find(session[:patient_id])
		@appointment = Appointment.find(session[:appointment_id])
		@medication = Medication.new
		render '/appointments/medication_input'
	end

	def medication_submit
		@medication = Appointment.find(session[:appointment_id]).medications.new(medication_params)
		if @medication.save
			redirect_to medical_record_appointment_medications_input_path(params[:medical_record_id])
		else
			flash[:danger] = 'Medication record creation failed'
			redirect_to medical_record_appointment_medications_input(params[:medical_record_id])
		end
	end

	def completed
		session[:patient_id] = nil
		session[:appointment_id] = nil
		redirect_to doctor_path(current_user.doctor)
	end

	private

	def appointment_params
		params[:appointment].permit(:appointment_date, :notes)
	end

	def medication_params
		params[:medication].permit(:name, :dosage)
	end
end
