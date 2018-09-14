require 'csv'

module Importer do
  FACTSHEET                     = "#{Rails.root}/lib/data/seeds/factsheet.csv".freeze
  EXPLORE_BY_ASSET              = "#{Rails.root}/lib/data/seeds/explore_by_asset.csv".freeze
  EXPLORE_BY_ECOSYSTEM_SERVICE  = "#{Rails.root}/lib/data/seeds/explore_by_ecosystem_service.csv".freeze

  def self.import_sectors_and_subindustries
    begin
      CSV.foreach(EXPLORE_BY_ASSET, headers: true) do |row|
        sector_name      = row[0].strip
        subindustry_name = row[1].strip

        sector = Sector.where(name: sector_name).first_or_create do |sector|
          sector.name = sector_name
        end

        SubIndustry.where(name: subindustry_name).first_or_create do |subindustry|
          subindustry.name   = subindustry_name
          subindustry.sector = sector
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end
end
