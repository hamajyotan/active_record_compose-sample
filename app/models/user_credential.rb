class UserCredential < ApplicationRecord
  has_secure_password

  belongs_to :user
  validates :email, :password, presence: true
end
