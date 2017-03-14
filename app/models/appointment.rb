class Appointment < ApplicationRecord
  belongs_to :medical_record
  has_many :medications
  validates_presence_of :appointment_date, :notes
end
