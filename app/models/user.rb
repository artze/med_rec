class User < ApplicationRecord
  include Clearance::User
  has_one :doctor
  has_one :patient
  enum role: [:patient, :doctor]
end
