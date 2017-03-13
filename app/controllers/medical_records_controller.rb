class MedicalRecordsController < ApplicationController

	def index
		@medicalrecords = MedicalRecord.all 
	end 

	def new 
		# if else for user roles
		@medicalrecord = MedicalRecord.new
	end 

	def create
		@medicalrecord = MedicalRecord.new(mr_params)
		if @medicalrecord.save!
			#redirect to MR#show
		else 
			#redirect to MR#new
		end 
	end 

	def show 
		@patient = current_user
		@medicalrecord = MedicalRecord.find_by(id: params[:id])
	end 

	private

	def mr_params 
	end 

end