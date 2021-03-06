class ApplicationController < ActionController::Base
  PERMITED_COLUMNS_FOR_USER = [
    :name,
    :nick,
    :member_number,
    :screen_name,
    :screen_name_kana,
  ]

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    PERMITED_COLUMNS_FOR_USER.each do |column|
      devise_parameter_sanitizer.for(:sign_up) << column
      devise_parameter_sanitizer.for(:sign_in) << column
      devise_parameter_sanitizer.for(:account_update) << column
    end
  end

  protect_from_forgery with: :exception
end
