require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should require username" do
    @user.username = nil
    assert_not @user.valid?
    assert @user.errors[:username].present?
  end

  test "should require unique username" do
    duplicate_user = User.new(
      username: @user.username,
      email_address: "different@example.com",
      password: "password123"
    )

    assert_not duplicate_user.valid?
    assert duplicate_user.errors[:username].present?
  end

  test "should require email_address" do
    @user.email_address = nil
    assert_not @user.valid?
    assert @user.errors[:email_address].present?
  end

  test "should require unique email_address" do
    duplicate_user = User.new(
      username: "different_user",
      email_address: @user.email_address,
      password: "password123"
    )

    assert_not duplicate_user.valid?
    assert duplicate_user.errors[:email_address].present?
  end

  test "should normalize email_address to lowercase" do
    mixed_case_email = "Test.User@EXAMPLE.COM"
    @user.email_address = mixed_case_email
    @user.save!

    assert_equal "test.user@example.com", @user.reload.email_address
  end

  test "should strip whitespace from email_address" do
    email_with_spaces = "  test@example.com  "
    @user.email_address = email_with_spaces
    @user.save!

    assert_equal "test@example.com", @user.reload.email_address
  end

  test "name should return full name when both first and last name present" do
    @user.first_name = "John"
    @user.last_name = "Doe"

    assert_equal "John Doe", @user.name
  end

  test "name should return first name only when last name blank" do
    @user.first_name = "John"
    @user.last_name = ""

    assert_equal "John", @user.name
  end

  test "name should return last name only when first name blank" do
    @user.first_name = ""
    @user.last_name = "Doe"

    assert_equal "Doe", @user.name
  end

  test "name should return nil when both names blank" do
    @user.first_name = ""
    @user.last_name = ""

    assert_nil @user.name
  end
end
