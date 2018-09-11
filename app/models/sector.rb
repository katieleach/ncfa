class Sector < ApplicationRecord
  has_many :sub_industries
  has_many :production_processes, through: :sub_industries
end
