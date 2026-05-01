class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user!

  def show
    @user = User.find(params[:id])
  end

  private

  def correct_user!
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end
end