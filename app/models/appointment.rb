class Appointment < ApplicationRecord
  belongs_to :medical_record
  validates_presence_of :appointment_date, :notes
end
