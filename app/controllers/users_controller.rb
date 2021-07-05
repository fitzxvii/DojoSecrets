class UsersController < ApplicationController
  def new
  end

  def show
    @current_user = User.find(session[:user_id])
  end

  def create
    @new_user = User.new(login_params)
    if @new_user.valid?
      @new_user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = @new_user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def login_params
  	params.require(:join).permit(:name, :email, :password, :password_confirmation)
  end
end
