class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    if signed_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    @user = params[:id]
    @user.update(set_user)
    redirect_to root_path
  end

  def destroy
  end


  private

  def set_user
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
