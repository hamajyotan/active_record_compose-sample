class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile

  delegate :authenticate, to: :user_credential, allow_nil: true
  delegate :name, to: :user_profile, allow_nil: true
end
