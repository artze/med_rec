class Medication < ApplicationRecord
	belongs_to :appointment
	validates_presence_of :name, :dosage
end
