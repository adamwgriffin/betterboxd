class MoviesController < ApplicationController
  # Authenticate the user if they're logged in with resume_session, but don't
  # require them to be logged in to view the page
  allow_unauthenticated_access
  before_action :resume_session

  def index
    @movies = Movie.all.limit(4)
    @reviews = Review.includes(:user, :movie).all.limit(10).order(date_watched: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.includes(:user).where(movie: @movie).limit(4).order(date_watched: :desc)
  end
end
