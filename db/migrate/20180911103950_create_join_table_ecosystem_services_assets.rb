class CreateJoinTableEcosystemServicesAssets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :ecosystem_services, :assets do |t|
      t.index [:ecosystem_service_id, :asset_id]
      t.index [:asset_id, :ecosystem_service_id]
    end
  end
end
