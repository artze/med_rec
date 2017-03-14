class RenameDobColumnInPatients < ActiveRecord::Migration[5.0]
  def change
  	rename_column :patients, :DOB, :date_of_birth
  end
end
