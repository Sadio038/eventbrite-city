class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin!

  private

  def check_if_admin!
    unless current_user.is_admin?
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end
end
