class Medication < ApplicationRecord
	belongs_to :medical_record
	validates_presence_of :name, :dosage
end
