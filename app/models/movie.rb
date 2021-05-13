class Movie < ApplicationRecord
  has_many :bookmarks
  has_one :list, through: :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
