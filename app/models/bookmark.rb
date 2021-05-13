class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie, :scope => [:list]
  # validates :movie_id, presence: true
  # validates :user_id, presence: true
  # validates_uniqueness_of :id, :scope => [:movie_id, :list_id]
  # validates :id, uniqueness: { scope: :movie, :list }
  # uniqueness: { scope: :movie, list: }
end
