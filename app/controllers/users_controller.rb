class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
    if signed_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    @user.update(set_user)
    redirect_to root_path
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end


  def set_user
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
