class Asset < ApplicationRecord
  # has_and_belongs_to_many :drivers
  # has_and_belongs_to_many :ecosystem_services
  has_many :ecosystem_services, through: :ecosystem_services_assets_join
  has_many :drivers, through: :assets_drivers_join
end
