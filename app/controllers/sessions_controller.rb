class SessionsController < ApplicationController
  before_action :require_login, only: %i[destroy]
  before_action :set_new_session, only: %i[new create]

  def new
  end

  def create
    if @session.update(session_params)
      session[:user_id] = @session.authorized_user.id
      redirect_to root_path, notice: "logged in", status: :see_other
    else
      session[:user_id] = nil
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "signed out.", status: :see_other
  end

  private

  def set_new_session
    @session = Session.new
  end

  def session_params
    params.expect(session: %i[email password])
  end
end
