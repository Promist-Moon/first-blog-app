class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [ :new, :create ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log the user in by saving their user_id to session
      redirect_to root_path, notice: "Successfully created an account!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
