class Dashboard::ProfilesController < Dashboard::ApplicationController
  before_action :set_dashboard_profile, only: %i[show update]

  def show; end

  def update
    if @dashboard_profile.update(dashboard_profile_params)
      redirect_to dashboard_profile_path, notice: "ほげ", status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_dashboard_profile
    @dashboard_profile = Dashboard::Profile.new(current_user)
  end

  def dashboard_profile_params
    params.expect(dashboard_profile: %i[name])
  end
end
