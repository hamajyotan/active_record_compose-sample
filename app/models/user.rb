class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile
  has_many :posts

  delegate :name, to: :user_profile, allow_nil: true

  scope :active, -> { where.associated(:user_credential) }
end
