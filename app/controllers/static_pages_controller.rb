class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def about_ncfa
  end

  def about_aerm
  end

  def methodology
  end
  
  def collection
  end
  
  def limitations
  end
  
  def ratings
  end

  def sectors
    @sectors = Sector.all
  end

end
