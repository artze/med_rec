class StaticController < ApplicationController

  def index
  	if  signed_in?
  		if current_user.patient?
  		redirect_to patient_path(current_user.patient)
  		else 
  		redirect_to doctor_path(current_user.doctor)
  		end
  	else
  		redirect_to sign_in_path
  	end 
  end
end
