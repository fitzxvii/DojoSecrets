class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  before_action :check_user, only: [:edit, :show, :update, :delete]

  def new
  end

  def show
    @current_user = User.find(session[:user_id])
    @secrets = Secret.all
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params['Name']
    @user.email = params['Email']
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.valid?
      @user.destroy
      reset_session
      redirect_to '/users/new'
    else
      redirect_to '/sessions/new'
    end
  end

  private
    def login_params
  	  params.require(:join).permit(:name, :email, :password, :password_confirmation)
    end

    def check_user
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    end
end
