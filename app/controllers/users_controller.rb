class UsersController < ApplicationController
  def new
  end

  def show
    @current_user = User.find(session[:user_id]);
  end
end
