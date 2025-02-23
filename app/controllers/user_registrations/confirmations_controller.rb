class UserRegistrations::ConfirmationsController < UserRegistrations::ApplicationController
  before_action :require_valid_token
  before_action :set_confirmation, only: %i[new create]

  def new; end

  def create
    if @confirmation.update(confirmation_params)
      session[:user_id] = @confirmation.registered_user.id
      redirect_to root_path, notice: "User registered!", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_valid_token
    raise ActiveRecord::RecordNotFound unless @user_registration.token == params.expect(:token)
  end

  def set_confirmation
    @confirmation = UserRegistrations::Confirmation.new(@user_registration)
  end

  def confirmation_params
    params.expect(confirmation: %i[name password password_confirmation])
  end
end
