class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # Prevent deletion if movie is referenced in bookmarks
  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
      raise ActiveRecord::InvalidForeignKey, "Cannot delete movie referenced in bookmarks"
    end
  end
end
