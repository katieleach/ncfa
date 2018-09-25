class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
    # look up production processes this driver is 'likely to influence' via assets->services->materialities
    services = EcosystemService.find(@driver.assets.map(&:id))
    @materialities = services.map(&:materialities).flatten(1).uniq(&:production_process)
  end
end
