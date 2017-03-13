class Patient < ApplicationRecord
  belongs_to :user
  has_many :medical_records
  validates_presence_of :date_of_birth
  validate :date_of_birth_in_past

  def date_of_birth_in_past
  	if self.date_of_birth > Date.today
  		errors.add(:DOB, 'Date of birth can\'t be in future')
  	end
  end
end
