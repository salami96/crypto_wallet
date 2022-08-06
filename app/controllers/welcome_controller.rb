class WelcomeController < ApplicationController
  def index
    @id = params
    session[:name] = params[:name] if params[:name].present?
  end
end
