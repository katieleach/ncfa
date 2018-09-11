class Asset < ApplicationRecord
  has_and_belongs_to_many :drivers
  has_and_belongs_to_many :ecosystem_services
end
