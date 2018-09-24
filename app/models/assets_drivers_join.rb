class AssetsDriversJoin < ApplicationRecord
  belongs_to :asset
  belongs_to :driver
end
