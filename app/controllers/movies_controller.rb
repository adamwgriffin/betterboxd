class MoviesController < ApplicationController
  # Authenticate the user if they're logged in with resume_session, but don't
  # require them to be logged in to view the page
  allow_unauthenticated_access
  before_action :resume_session

  def index
    @movies = Movie.all.limit(4)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
