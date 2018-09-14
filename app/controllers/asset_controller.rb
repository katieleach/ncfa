class AssetController < ApplicationController
  def index
    @assets = Asset.all
  end
end
