class EcosystemServiceController < ApplicationController
  def index
    @services = EcosystemService.all
  end
end
