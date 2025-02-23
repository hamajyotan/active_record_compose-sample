class UserRegistrationMailer < ApplicationMailer
  before_action do
    @user_registration = params[:user_registration]
  end

  def requested
    mail to: @user_registration.email
  end
end
