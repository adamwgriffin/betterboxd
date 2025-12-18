class Follow < ApplicationRecord
  # These belongs_to associations allow the has_many :following and has_many
  # :followers associations to work correct for the User model
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validate :cannot_follow_self

  private

  def cannot_follow_self
    errors.add(:followed, "You cannot follow yourself") if follower_id == followed_id
  end
end
