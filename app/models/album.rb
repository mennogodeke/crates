class Album < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  has_many :songs, dependent: :destroy
  validates :title, presence: true
  validates :label, presence: true
  validates :year, presence: true
end
