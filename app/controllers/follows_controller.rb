class FollowsController < ApplicationController
  before_action :set_user

  def create
    if Current.user.follow(@user)
      redirect_to user_path(@user.username), notice: "You are now following @#{@user.username}"
    else
      redirect_to user_path(@user.username), alert: "Unable to follow user"
    end
  end

  def destroy
    Current.user.unfollow(@user)
    redirect_to user_path(@user.username), notice: "You unfollowed @#{@user.username}"
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found"
  end
end
