class Api::ExploreController < ActionController::API
  before_action :set_headers

  def set_headers
    response.headers['Content-Type'] = 'application/json'
  end
  
  def services
    services = EcosystemService.all.includes([:assets, materialities: [:production_process]])

    render json: services.to_json(:only => [:id, :name], :include =>{
                                    :assets => {
                                      :only => [:id, :name] },
                                    :materialities => {
                                      :only => [:id, :rag], :include => {
                                        :production_process => {:only => [:id, :name] } }
                                    }
                                  } ), status: :ok
  end

  def assets
    assets = Asset.all.includes(ecosystem_services: [materialities: [:production_process]]).where(production_process: process_ids)
    
    render json: assets.to_json(:only => [:id, :name], :include => {
                                  :ecosystem_services  => {
                                    :only => [:id, :name], :include => {
                                      :materialities => {
                                        :only => [:id, :rag], :include => {
                                          :production_process => {:only => [:id, :name] }
                                        }
                                      }
                                    }
                                  }
                                }
                               ), status: :ok
  end
  
  def sectors
    sectors = Sector.all.includes(sub_industries: [:production_processes] )

    render json: sectors.to_json(:only => [:id, :name], :include => {
                                   :sub_industries => {
                                     :only => [:id, :name], :include => {
                                       :production_processes => {:only => [:id, :name] }
                                     }
                                   }
                                 } ), status: :ok
  end

  private
  
  def filter_params
    params.permit(:sector_id, :sub_industry_id, :production_processes)
  end
  
end
