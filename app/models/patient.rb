class Patient < ApplicationRecord
  belongs_to :user
  has_many :medical_records
  validates_presence_of :date_of_birth, :gender, :height, :weight, :blood_type
  validates_inclusion_of :gender, in: %w( Male Female )
  validates_inclusion_of :height, in: 20..250
  validates_inclusion_of :weight, in: 5..400
  validates_inclusion_of :blood_type, in: %w( O A B AB )
  validate :date_of_birth_in_past

  def date_of_birth_in_past
  	if self.date_of_birth > Date.today
  		errors.add(:DOB, 'Date of birth can\'t be in future')
  	end
  end
end
