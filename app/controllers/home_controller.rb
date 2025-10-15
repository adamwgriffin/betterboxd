class HomeController < ApplicationController
  # Authenticate the user if they're logged in with resume_session, but don't
  # require them to be logged in to view the page
  allow_unauthenticated_access
  before_action :resume_session

  def index
    @reviews = Review.includes(:user, :movie).all.limit(10).order(date_watched: :desc)
  end
end
