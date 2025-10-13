class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email_address, presence: true, uniqueness: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def name
    [ first_name, last_name ].reject(&:blank?).join(" ").presence
  end
end
