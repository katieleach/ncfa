class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
    @materialities = @asset.ecosystem_services.map(&:materialities).flatten(1).uniq(&:production_process)
  end
end
