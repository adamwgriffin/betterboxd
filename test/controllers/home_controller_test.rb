require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @movie = movies(:pulp_fiction)
  end

  # Basic functionality tests
  test "should allow access with authentication" do
    sign_in_as @user
    get root_path
    assert_response :success
  end

  test "should allow access without authentication" do
    get root_path
    assert_response :success
  end

  # View tests
  test "should display a welcome message when the user is logged in" do
    sign_in_as @user
    get root_path
    assert_response :success
    assert_select "#welcome-message", count: 1
  end

  test "should not display a welcome message when the user is not logged in" do
    get root_path
    assert_response :success
    assert_select "#welcome-message", count: 0
  end

  test "should display up to 10 reviews" do
    review = Review.create!(
      user: @user,
      movie: @movie,
      body: "Great movie!",
      date_watched: 1.day.ago
    )
    get root_path

    assert_response :success
    assert_select ".review p", text: review.body
    assert_select ".review", minimum: 1, maximum: 10
  end
end
