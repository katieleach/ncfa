class Sector < ApplicationRecord
  has_many :sub_industries, dependent: :destroy
  has_many :production_processes, through: :sub_industries
end
