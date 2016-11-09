class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def pictures
    @pimages = Pimage.all
  end
  def design
  end
  
  def markinfos
    @pimages = Pimage.all
  end
  
end
