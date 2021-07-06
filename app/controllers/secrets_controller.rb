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
    secret = Secret.find(params[:id])
    if secret.user == @user
      secret.destroy
    end
    redirect_to  "/users/#{@user.id}"
  end
end
