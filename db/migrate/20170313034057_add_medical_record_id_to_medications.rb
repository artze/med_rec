class AddMedicalRecordIdToMedications < ActiveRecord::Migration[5.0]
  def change
    add_reference :medications, :medical_record, foreign_key: true
  end
end
