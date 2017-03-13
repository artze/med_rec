class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage

      t.timestamps
    end
  end
end
