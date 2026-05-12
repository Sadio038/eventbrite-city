class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :correct_user!

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profil mis à jour avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user!
    unless current_user == @user
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :avatar)
  end
end