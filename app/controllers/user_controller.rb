class UserController < ApplicationController
  def user_description
    @user_id = params[:user_id].to_i
  end
end
