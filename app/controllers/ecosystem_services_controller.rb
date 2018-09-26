class EcosystemServicesController < ApplicationController
  def index
    @services = EcosystemService.all
  end

  def show
    @service = EcosystemService.find(params[:id])
  end
end
