class Dashboard::SettingsController < Dashboard::ApplicationController
  before_action :set_dashboard_setting, only: %i[show update]

  def show; end

  def update
    if @dashboard_setting.update(dashboard_setting_params)
      redirect_to dashboard_setting_path, notice: "ほげ", status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_dashboard_setting
    @dashboard_setting = Dashboard::Setting.new(current_user)
  end

  def dashboard_setting_params
    params.expect(dashboard_setting: %i[name])
  end
end
