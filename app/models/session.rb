class Session < ApplicationModel
  attribute :email, :string
  attribute :password, :string

  validates :email, :password, presence: true
  validate :require_authenticated

  before_validation :normalize
  before_validation :authenticate

  attr_reader :authorized_user

  private

  def normalize
    self.email = email&.downcase
  end

  def authenticate
    @authorized_user =
      if email.present? && password.present? && (credential = UserCredential.find_by(email:)&.authenticate(password))
        credential.user
      end
  end

  def require_authenticated
    return if authenticated_user.present?

    errors.add(:base, :login_failed)
  end
end
