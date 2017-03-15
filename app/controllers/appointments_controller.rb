class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(medical_record_id: params[:medical_record_id])
	end

	def patient_input
		render '/appointments/patient_input'
	end

	def patient_submit

	end

	def new

	end

	def create

	end
end
