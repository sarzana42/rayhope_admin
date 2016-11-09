class Rayadmin::MarkinfosController < Rayadmin::RayadminController
  before_action :set_markinfo, only: [:show, :edit, :update, :destroy]

  # GET /markinfos
  def index
    @markinfos = Markinfo.all
  end

  # GET /markinfos/1
  def show
  end

  # GET /markinfos/new
  def new
    @markinfo = Markinfo.new
  end

  # GET /markinfos/1/edit
  def edit
  end

  # POST /markinfos
  def create
    @markinfo = Markinfo.new(markinfo_params)

    if @markinfo.save
      redirect_to [:rayadmin, @markinfo], notice: 'Markinfo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /markinfos/1
  def update
    if @markinfo.update(markinfo_params)
      redirect_to [:rayadmin, @markinfo], notice: 'Markinfo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /markinfos/1
  def destroy
    @markinfo.destroy
    redirect_to rayadmin_markinfos_url, notice: 'Markinfo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_markinfo
      @markinfo = Markinfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def markinfo_params
      params.require(:markinfo).permit(:title, :description, :user_id)
    end
end
