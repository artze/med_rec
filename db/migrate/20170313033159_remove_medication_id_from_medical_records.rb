class RemoveMedicationIdFromMedicalRecords < ActiveRecord::Migration[5.0]
  def change
  	remove_column :medical_records, :medication_id, :integer
  end
end