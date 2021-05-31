class User < ApplicationRecord
    validates :title, :address, presence: true
  geocoded_by :address
  after_validation :geocode
end
