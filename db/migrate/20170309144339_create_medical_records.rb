class CreateMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_records do |t|
      t.references :patient, index: true, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :medical_condition, index: true, foreign_key: true
      t.references :medical_category, foreign_key: true

      t.timestamps
    end
  end
end
