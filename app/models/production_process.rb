class ProductionProcess < ApplicationRecord
  belongs_to :sub_industry
  has_many :materialities
  has_many :ecosystem_services, through: :materiality
end
