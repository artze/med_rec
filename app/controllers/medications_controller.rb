class MedicationsController < ApplicationController
	def medications_input
		@medication = Medication.new
		@appointment = Appointment.find(session[:appointment_id])
		render :new
	end

	def medications_submit
		@medication = Appointment.find(session[:appointment_id]).medications.new(medication_params)
		if @medication.save
			redirect_to doctor_medications_input_path
		end
	end

	private

	def medication_params
		params[:medication].permit(:name, :dosage)
	end
end
