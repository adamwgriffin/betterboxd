class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
end
