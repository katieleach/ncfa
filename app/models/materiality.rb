class Materiality < ApplicationRecord
  belongs_to :production_process
  belongs_to :ecosystem_service
end
