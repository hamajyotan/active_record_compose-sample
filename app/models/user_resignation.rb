class UserResignation < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    models.push(user_profile, destroy: true)
    models.push(user_credential, destroy: true)
    super()
  end

  private

  attr_reader :user

  delegate :user_profile, :user_credential, to: :user, private: true
end
