class Rayadmin::SpricesController < Rayadmin::RayadminController
  before_action :set_sprice, only: [:show, :edit, :update, :destroy]

  # GET /sprices
  def index
    @sprices = Sprice.all
  end

  # GET /sprices/1
  def show
  end

  # GET /sprices/new
  def new
    @sprice = Sprice.new
  end

  # GET /sprices/1/edit
  def edit
  end

  # POST /sprices
  def create
    @sprice = Sprice.new(sprice_params)

    if @sprice.save
      redirect_to [:rayadmin, @sprice], notice: 'Sprice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sprices/1
  def update
    if @sprice.update(sprice_params)
      redirect_to [:rayadmin, @sprice], notice: 'Sprice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sprices/1
  def destroy
    @sprice.destroy
    redirect_to sprices_url, notice: 'Sprice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprice
      @sprice = Sprice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sprice_params
      params.require(:sprice).permit(:teikyo, :acompany, :skuc, :jproduct, :eproduct, :pnumber, :p1cos, :p2cos, :p3cos, :p4cos)
    end
end
