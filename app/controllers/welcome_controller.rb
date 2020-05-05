class WelcomeController < ApplicationController
  def user
    @user = params[:first_name]
  end
end

