class Crate < ApplicationRecord
  has_many :crate_entries, dependent: :destroy
  validates :name, presence: true
  belongs_to :user
end
