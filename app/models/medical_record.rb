class MedicalRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :medical_condition
  belongs_to :medical_category
  has_many :medications
end
