class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def pictures
    @kamons = Kamon.all
  end
  def design
  end
  
  def markinfos
    @pimages = Pimage.all
  end
  
end
