# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'

# CSV.foreach('app/db/diseases.csv') do |row|
# 	MedicalCondition.create(name: row[0])
# end

# Medical Categories

category_arr = ['Neurology',
'Orthopaedics',
'Cancer',
'Paediatrics',
'Ear, Nose and Throat',
'Ophthalmology',
'Cardiovascular',
'Endocrinology',
'Renal Disorders',
'Respiratory Disorders',
'Gastroenterology',
'Urinary & Reproductive System',
'Obstetrics & Gynaecology',
'Oral and Maxillofacial',
'Dermatology',
'Geriatic Disorders',
'Haematology',
'Psychiatry',
'Infectious Diseases',
'Rheumatology']

category_arr.each do |elm|
	MedicalCategory.create(name: elm)
end