class AddAttributesToPatients < ActiveRecord::Migration[5.0]
  def change
  	add_column :patients, :gender, :string
  	add_column :patients, :height, :integer
  	add_column :patients, :weight, :integer
  	add_column :patients, :blood_type, :string
  end
end
