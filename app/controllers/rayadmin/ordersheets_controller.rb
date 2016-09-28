class Rayadmin::OrdersheetsController < Rayadmin::RayadminController
  def index
  end
  
  def new
    @ordersheet = Ordersheet.new
  end
end
