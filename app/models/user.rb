class User < ApplicationRecord
  include Clearance::User
  has_one :doctor
  has_one :patient
end
