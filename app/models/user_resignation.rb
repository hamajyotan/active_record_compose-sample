class UserResignation < ApplicationModel
  def initialize(user)
    @user = user
    models.push(user)
    models.push(user_profile, destroy: true)
    models.push(user_credential, destroy: true)
    super()
  end

  before_validation :set_resigned_at

  private

  attr_reader :user

  delegate :user_profile, :user_credential, to: :user, private: true

  def set_resigned_at
    user.resigned_at = Time.current
  end
end
