class EcosystemServicesAssetsJoin < ApplicationRecord
  belongs_to :ecosystem_service
  belongs_to :asset
end
