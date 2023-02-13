class Artist < ApplicationRecord
  validates :full_name, presence: true
end
