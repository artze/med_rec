class Patient < ApplicationRecord
  belongs_to :user
  has_many :medical_records
  validates_presence_of :DOB
  validate :date_of_birth_in_past

  def date_of_birth_in_past
  	if DOB.present? && DOB > Date.today
  		erros.add(:DOB, 'Date of birth can\'t be in future')
  	end
  end
end
