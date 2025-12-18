require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = movies(:pulp_fiction)
  end

  test "should be valid with valid attributes" do
    assert @movie.valid?
  end

  test "should require title" do
    @movie.title = nil
    assert_not @movie.valid?
  end

  test "should have many reviews" do
    assert_respond_to @movie, :reviews
  end

  test "should destroy associated reviews when movie is destroyed" do
    user = users(:one)
    review = @movie.reviews.create!(
      user: user,
      body: "Great movie!",
      date_watched: Date.current
    )
    review_id = review.id
    @movie.destroy!

    assert_raises(ActiveRecord::RecordNotFound) do
      Review.find(review_id)
    end
  end
end
