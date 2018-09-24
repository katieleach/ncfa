class Driver < ApplicationRecord
  has_many :assets_drivers_joins
  has_many :assets, through: :assets_drivers_joins
end
