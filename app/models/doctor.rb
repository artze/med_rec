class Doctor < ApplicationRecord
  belongs_to :user
  has_many :medical_records
end
