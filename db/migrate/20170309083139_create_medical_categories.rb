class CreateMedicalCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
