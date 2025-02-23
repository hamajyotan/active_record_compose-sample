class Dashboard::Profile < ApplicationModel
  def initialize(user)
    @user = user
    super()
    models << user_profile
  end

  delegate_attribute :name, to: :user_profile

  def persisted? = true

  private

  attr_reader :user

  delegate :user_profile, to: :user, private: true
end
