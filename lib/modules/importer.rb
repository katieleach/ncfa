require 'csv'

module Importer
  FACTSHEET                     = "#{Rails.root}/lib/data/seeds/factsheet.csv".freeze
  EXPLORE_BY_ASSET              = "#{Rails.root}/lib/data/seeds/explore_by_asset.csv".freeze
  EXPLORE_BY_ECOSYSTEM_SERVICE  = "#{Rails.root}/lib/data/seeds/explore_by_ecosystem_service.csv".freeze

  def self.import_sectors_subindustries_and_processes
    begin
      CSV.foreach(EXPLORE_BY_ASSET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        sector_name             = row[0].strip
        sub_industry_name       = row[1].strip
        production_process_name = row[2].strip

        sector = Sector.where(name: sector_name).first_or_create do |sector|
          sector.name = sector_name
        end

        sub_industry = SubIndustry.where(name: sub_industry_name).first_or_create do |subindustry|
          subindustry.name   = sub_industry_name
          subindustry.sector = sector
        end

        ProductionProcess.where(name: production_process_name).first_or_create do |production_process|
          production_process.name         = production_process_name
          production_process.sub_industry = sub_industry
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end
end
