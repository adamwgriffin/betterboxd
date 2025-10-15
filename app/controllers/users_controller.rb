class UsersController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session
  before_action :set_user, only: [ :show ]

  def show
  end

  private

  def set_user
    @user = User.includes(:reviews).find_by!(username: params[:username])
    @reviews = @user.reviews.includes(:movie)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found"
  end
end
