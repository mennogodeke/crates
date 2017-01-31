class Album < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :format

  accepts_nested_attributes_for :format

  has_many :songs, dependent: :destroy
  has_many :crate_entries

  validates :title, presence: true
  validates :label, presence: true
  validates :year, presence: true
  validate :validate_properties

  def validate_properties
    format.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "Must not be blank"
      end
    end
  end

  serialize :properties, Hash
end
