require "test_helper"

class FollowTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @follow = Follow.new(follower: @user, followed: @other_user)
  end

  # Basic validation tests
  test "should be valid with valid attributes" do
    assert @follow.valid?
  end

  # Association tests
  test "should belong to follower" do
    assert_respond_to @follow, :follower
    assert_instance_of User, @follow.follower
  end

  test "should belong to followed" do
    assert_respond_to @follow, :followed
    assert_instance_of User, @follow.followed
  end

  test "should require follower" do
    @follow.follower = nil
    assert_not @follow.valid?
    assert_includes @follow.errors[:follower], "must exist"
  end

  test "should require followed" do
    @follow.followed = nil
    assert_not @follow.valid?
    assert_includes @follow.errors[:followed], "must exist"
  end

  test "should not allow user to follow themselves" do
    self_follow = Follow.new(follower: @user, followed: @user)
    assert_not self_follow.valid?
    assert_includes self_follow.errors[:followed], "You cannot follow yourself"
  end
end
