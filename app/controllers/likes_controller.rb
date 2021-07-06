class LikesController < ApplicationController
  before_action :check_user, only: [:destroy]
  def create
    @user = current_user
    @secret = Secret.find(params[:id])
    @like = Like.new(user: @user, secret:@secret)
    if @like.valid?
      @like.save
      redirect_to '/secrets'
    else
      flash[:errors] =['Something went wrong']
      redirect_to '/secrets'
    end
  end

  def destroy
    @user = current_user
    @secret = Secret.find(params[:id])
    @like = Like.find_by(user: @user, secret: @secret)
    if @like.valid?
      @like.destroy
      redirect_to '/secrets'
    else
      flash[:errors] =['Something went wrong']
      redirect_to '/secrets'
    end
  end

  private
  def check_user
    @secret = Secret.find(params[:id])
    @like = Like.find_by(user: current_user, secret: @secret)
    if current_user != @like.user
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
