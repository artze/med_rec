class MedicationsController < ApplicationController
	def medications_input
		@medication = Medication.new
		render :new
	end

	def medications_submit
		@medication = MedicalRecord.find(session[:medical_record_id]).medications.new(medication_params)
		if @medication.save
			redirect_to doctor_medications_input_path
		end
	end

	private

	def medication_params
		params[:medication].permit(:name, :dosage)
	end
end
