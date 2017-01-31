class CrateEntry < ApplicationRecord
  belongs_to :album
  belongs_to :crate
end
