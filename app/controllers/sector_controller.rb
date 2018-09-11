class SectorController < ApplicationController
  def index
    @sectors = Sector.all
  end
end
