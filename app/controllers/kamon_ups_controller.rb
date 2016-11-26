class KamonUpsController < ApplicationController
  def index
    @kamons = Kamon.all
  end
  
  def show
    @kamon = Kamon.find(params[:id])
  end
  
end
