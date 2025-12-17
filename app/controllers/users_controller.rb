class UsersController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session

  def show
    @user = User.includes(:reviews).find_by!(username: params[:username])
    @reviews = @user.reviews.includes(:movie)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found"
  end
end
