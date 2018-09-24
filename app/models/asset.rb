class Asset < ApplicationRecord
  has_many :ecosystem_services_assets_joins
  has_many :ecosystem_services, through: :ecosystem_services_assets_joins

  has_many :assets_drivers_joins
  has_many :drivers, through: :assets_drivers_joins
end
