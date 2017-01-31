class Format < ApplicationRecord
  has_many :albums
  has_many :fields, class_name: "FormatField", dependent: :destroy
  accepts_nested_attributes_for :fields, allow_destroy: true
end
