class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.text :notes
      t.references :medical_record, foreign_key: true

      t.timestamps
    end
  end
end
