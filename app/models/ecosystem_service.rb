class EcosystemService < ApplicationRecord
  has_many :materialities
  has_many :production_processes, through: :materiality

  has_many :ecosystem_services_assets_joins
  has_many :assets, through: :ecosystem_services_assets_joins
end
