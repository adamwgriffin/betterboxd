require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = reviews(:one)
  end

  test "should belong to user" do
    assert_respond_to @review, :user
  end

  test "should belong to movie" do
    assert_respond_to @review, :movie
  end

  test "should be valid with valid attributes" do
    assert @review.valid?
  end

  test "should require user" do
    @review.user = nil
    assert_not @review.valid?
  end

  test "should require movie" do
    @review.movie = nil
    assert_not @review.valid?
  end

  test "should require body" do
    @review.body = nil
    assert_not @review.valid?
  end
end
