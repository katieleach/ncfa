require 'csv'
require 'byebug'

module Importer
  SECTORS_SUBINDUSTRIES_AND_PROCESSES = "#{Rails.root}/lib/data/proposed_seeds/sector_subindustries_and_processes.csv".freeze
  ECOSYSTEM_SERVICES                  = "#{Rails.root}/lib/data/proposed_seeds/ecosystem_services.csv".freeze
  ASSETS                              = "#{Rails.root}/lib/data/proposed_seeds/assets.csv".freeze
  DRIVERS                             = "#{Rails.root}/lib/data/proposed_seeds/drivers.csv".freeze
  MATERIALITIES                       = "#{Rails.root}/lib/data/proposed_seeds/materialities.csv".freeze
  ECOSYSTEM_SERVICES_ASSETS_JOIN      = "#{Rails.root}/lib/data/proposed_seeds/ecosystem_services_assets_join.csv".freeze
  ASSETS_DRIVERS_JOIN                 = "#{Rails.root}/lib/data/proposed_seeds/assets_drivers_join.csv".freeze

  def self.import_all
    self.import_sectors_subindustries_and_processes
    self.import_ecosystem_services
    self.import_assets
    self.import_drivers
    self.import_materialities
    self.import_ecosystem_services_assets_join
    self.import_assets_drivers_join
  end

  def self.import_sectors_subindustries_and_processes
    begin
      CSV.foreach(SECTORS_SUBINDUSTRIES_AND_PROCESSES, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        sector_name             = row['Sector'].strip
        sub_industry_name       = row['Subindustry'].strip
        production_process_name = row['Process'].strip

        sector = Sector.find_or_create_by(name: sector_name)

        sub_industry = SubIndustry.find_or_create_by(
          name:   sub_industry_name,
          sector: sector
        )

        ProductionProcess.find_or_create_by(
          name:         production_process_name,
          sub_industry: sub_industry
        )
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_ecosystem_services
    begin
      CSV.foreach(ECOSYSTEM_SERVICES, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        EcosystemService.find_or_create_by(name: row['Ecosystem Service'].strip)
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_assets
    begin
      CSV.foreach(ASSETS, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        Asset.find_or_create_by(name: row['Asset'].strip)
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_drivers
    begin
      CSV.foreach(DRIVERS, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        Driver.find_or_create_by(name: row['Driver'].strip)
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_materialities
    begin
      CSV.foreach(MATERIALITIES, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        ecosystem_service   = EcosystemService.find_by_name(row['Ecosystem Service'].strip)
        production_process  = ProductionProcess.find_by_name(row['Process'].strip)

        Materiality.find_or_create_by(
          ecosystem_service:  ecosystem_service,
          production_process: production_process,
          rag:                row['RAG'],
          justification:      row['Justification']
        )
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_ecosystem_services_assets_join
    begin
      CSV.foreach(ECOSYSTEM_SERVICES_ASSETS_JOIN, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        ecosystem_service   = EcosystemService.find_by_name(row['Ecosystem Service'].strip)
        asset               = Asset.find_by_name(row['Asset'].strip)

        EcosystemServicesAssetJoin.find_or_create_by(
          ecosystem_service:  ecosystem_service,
          asset:              asset,
          importance:         row['Importance'],
          justification:      row['Justification']
        )
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end

  def self.import_assets_drivers_join
    begin
      CSV.foreach(ASSETS_DRIVERS_JOIN, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        asset   = Asset.find_by_name(row['Asset'].strip)
        driver  = Driver.find_by_name(row['Driver'].strip)

        AssetsDriversJoin.find_or_create_by(
          asset:                              asset,
          driver:                             driver,
          influence:                          row['Influence'],
          justification:                      row['Justification'],
          likely_response:                    row['Likely Response'],
          effect_on_variability:              row['Effect on Variability'],
          human_action_or_natural_variation:  row['Human action or natural variation'],
          timescale:                          row['Timescale'],
          spatial_characteristics:            row['Spatial characteristics']
        )
      end
    rescue => e
      Appsignal.set_error(e)
    end
  end
end
