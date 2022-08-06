class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if (params[:locale])
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale].presence != I18n.locale
      I18n.locale = cookies[:locale]
    end
  end
end
