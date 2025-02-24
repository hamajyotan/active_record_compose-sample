class Session < ApplicationModel
  attribute :email, :string
  attribute :password, :string

  validates :email, :password, presence: true

  before_validation :normalize
  before_validation :authenticate

  attr_reader :authorized_user

  private

  def normalize
    self.email = email&.downcase
  end

  def authenticate
    set_authenticated_user
    errors.add(:base, :login_failed) if authorized_user.blank?
  end

  def set_authenticated_user
    @authorized_user =
      if (authorized_user = UserCredential.find_by(email:)&.authenticate(password))
        authorized_user.user
      end
  end
end
