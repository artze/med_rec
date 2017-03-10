class AddDobToPatients < ActiveRecord::Migration[5.0]
  def change
  	add_column :patients, :DOB, :date
  end
end
