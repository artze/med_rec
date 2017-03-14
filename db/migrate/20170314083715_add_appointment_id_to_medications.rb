class AddAppointmentIdToMedications < ActiveRecord::Migration[5.0]
  def change
    add_reference :medications, :appointment, foreign_key: true
  end
end
