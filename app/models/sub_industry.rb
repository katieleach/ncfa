class SubIndustry < ApplicationRecord
  belongs_to :sector
  has_many :production_processes, dependent: :destroy
end
