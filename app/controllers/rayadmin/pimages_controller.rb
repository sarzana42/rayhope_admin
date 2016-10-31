class Rayadmin::PimagesController < Rayadmin::RayadminController
  before_action :set_pimage, only: [:show, :edit, :update, :destroy]

  # GET /pimages
  def index
    @pimages = Pimage.all
  end

  # GET /pimages/1
  def show
  end

  # GET /pimages/new
  def new
    @pimage = Pimage.new
  end

  # GET /pimages/1/edit
  def edit
  end

  # POST /pimages
  def create
    @pimage = Pimage.new(pimage_params)

    if @pimage.save
      redirect_to [:rayadmin, @pimage], notice: 'Pimage was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pimages/1
  def update
    if @pimage.update(pimage_params)
      redirect_to [:rayadmin, @pimage], notice: 'Pimage was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pimages/1
  def destroy
    @pimage.destroy
    redirect_to pimages_url, notice: 'Pimage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pimage
      @pimage = Pimage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pimage_params
      params.require(:pimage).permit(:ptitle, :purl, :pcomment, :ptag, :pimage, :pimage_cache)
    end
end
