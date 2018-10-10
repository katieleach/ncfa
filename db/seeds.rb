# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  es_animals = EcosystemService.create(name: 'Animal-based energy')
  es_bioremediation = EcosystemService.create(name: 'Bio-remediation')
  a_species = Asset.create(name:'Species')
  d_diseases = Driver.create(name: 'Diseases')
  d_pollution = Driver.create(name: 'Pollution')

  es_animals.assets << a_species
  a_species.drivers << d_diseases

  es_bioremediation.assets << a_species
end

Comfy::Cms::Site.create!(identifier: 'ncfa', hostname: 'localhost')
# Rake::Task['comfy:cms_seeds:import[ncfa, ncfa]'].invoke
