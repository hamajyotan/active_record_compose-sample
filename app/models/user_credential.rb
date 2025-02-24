class UserCredential < ApplicationRecord
  has_secure_password

  normalizes :email, with: ->(email) { email.strip.downcase }

  belongs_to :user
  validates :email, :password, presence: true
  validates :email, uniqueness: true
end
