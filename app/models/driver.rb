class Driver < ApplicationRecord
  # has_and_belongs_to_many :assets

  has_many :assets, through: :assets_drivers_join
end
