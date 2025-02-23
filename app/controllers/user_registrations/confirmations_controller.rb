class UserRegistrations::ConfirmationsController < UserRegistrations::ApplicationController
  before_action :set_confirmation, only: %i[new create]

  def new; end

  def create
    if @confirmation.update(confirmation_params)
      redirect_to root_path, notice: "ほげ"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_confirmation
    @confirmation = UserRegistrations::Confirmation.new(@user_registration)
  end

  def confirmation_params
    params.expect(confirmation: %i[name password password_confirmation])
  end
end
