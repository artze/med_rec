class AddMedicationIdToMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :medical_records, :medication, foreign_key: true
  end
end
