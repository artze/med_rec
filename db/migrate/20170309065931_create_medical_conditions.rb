class CreateMedicalConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
