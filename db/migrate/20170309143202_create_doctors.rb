class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.references :user, index: true, foreign_key: true
      t.string :specialization

      t.timestamps
    end
  end
end
