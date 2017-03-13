class User < ApplicationRecord
  include Clearance::User
  has_one :doctor
  has_one :patient
  enum role: [:patient, :doctor]

  validates_presence_of :full_name, :identity_card, :contact_number, :street_address, :postcode, :city, :country
  validates_uniqueness_of :identity_card
  validates_format_of :identity_card, with: /\A\d{6}-\d{2}-\d{4}\z/
  validates_format_of :contact_number, with: /\d{6,}/
end
