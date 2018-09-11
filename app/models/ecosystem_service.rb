class EcosystemService < ApplicationRecord
  has_and_belongs_to_many :assets
  has_many :materialities
  has_many :production_processes, through: :materiality
end
