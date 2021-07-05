class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def new
    @user = current_user
    @new_secret = Secret.create(content: params['Content'], user: User.find(params['user_id']))
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = current_user
    @delete_secret = Secret.find(params[:id]).destroy
    redirect_to "/users/#{@user.id}"
  end
end
