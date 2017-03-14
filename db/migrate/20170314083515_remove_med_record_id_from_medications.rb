class RemoveMedRecordIdFromMedications < ActiveRecord::Migration[5.0]
  def change
  	remove_column :medications, :medical_record_id, :integer
  end
end
