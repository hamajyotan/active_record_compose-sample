class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile

  delegate :name, to: :user_profile, allow_nil: true
end
