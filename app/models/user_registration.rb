class UserRegistration < ApplicationRecord
  belongs_to :user, optional: true

  attribute :expires_at, default: -> { 3.hours.after }

  validates :email, :token, :expires_at, presence: true
  validates :token, uniqueness: true

  scope :active, -> { where(expires_at: Time.current..) }

  before_validation :set_token

  private

  def set_token
    self.token ||= loop.lazy.map { SecureRandom.hex }.find { !self.class.exists?(token: _1) }
  end
end
