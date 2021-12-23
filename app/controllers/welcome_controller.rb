class WelcomeController < ApplicationController
  def index
    @id = params
    @name = params[:name]
  end
end
