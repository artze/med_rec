class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(medical_record_id: params[:medical_record_id])
	end
end
