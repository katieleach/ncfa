require 'csv'
require 'byebug'

module Importer
  FACTSHEET                     = "#{Rails.root}/lib/data/seeds/factsheet.csv".freeze
  EXPLORE_BY_ASSET              = "#{Rails.root}/lib/data/seeds/explore_by_asset.csv".freeze
  EXPLORE_BY_ECOSYSTEM_SERVICE  = "#{Rails.root}/lib/data/seeds/explore_by_ecosystem_service.csv".freeze

  def self.import_all
    self.import_sectors_sub_industries_and_processes
    self.import_ecosystem_services
    self.import_assets
    self.import_drivers
    self.import_materiality
  end

  def self.import_sectors_subindustries_and_processes
    begin
      CSV.foreach(EXPLORE_BY_ASSET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        sector_name             = row[0].strip
        sub_industry_name       = row[1].strip
        production_process_name = row[2].strip

        sector = Sector.where(name: sector_name).first_or_create do |sect|
          sect.name = sector_name
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

  def self.import_ecosystem_services
    begin
      CSV.foreach(FACTSHEET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        ecosystem_service_name = row['Ecosystem service'].strip

        EcosystemService.where(name: ecosystem_service_name).first_or_create do |ecosystem_service|
          ecosystem_service.name = ecosystem_service_name
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_assets
    begin
      CSV.foreach(FACTSHEET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        asset_name = row['Natural Capital Asset'].strip

        Asset.where(name: asset_name).first_or_create do |asset|
          asset.name = asset_name
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_drivers
    begin
      CSV.foreach(FACTSHEET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        driver_name = row['Driver of change'].strip

        Driver.where(name: driver_name).first_or_create do |driver|
          driver.name = driver_name
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_materiality
    begin
      CSV.foreach(EXPLORE_BY_ASSET, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        production_process = ProductionProcess.find_by_name(row['Production_Process'].strip)

        EcosystemService.all.each do |service|
          rag_col_name            = service.name.gsub(" ", "_") + "_Materiality"
          justification_col_name  = service.name.gsub(" ", "_") + "_Materiality_Justificiation"

          rag, justification = row[rag_col_name], row[justification_col_name]

          if rag.present? && justification.present?
            Materiality.create(
              production_process: production_process,
              ecosystem_service:  service,
              rag:                rag,
              justification:      justification,
            )
          end
        end
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end
end
