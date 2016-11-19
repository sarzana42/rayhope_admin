class Rayadmin::KamonsController < Rayadmin::RayadminController
  before_action :set_kamon, only: [:show, :edit, :update, :destroy]
  before_action :set_kamon_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit]

  # GET /kamons
  def index
    @kamons = params[:tag].present? ? Kamon.tagged_with(params[:tag]) : Kamon.all
    @kamons = @kamons.all.includes(:tags)
    
  end

  # GET /kamons/1
  def show
  end

  # GET /kamons/new
  def new
    @kamon = Kamon.new
  end

  # GET /kamons/1/edit
  def edit
  end

  # POST /kamons
  def create
    @kamon = Kamon.new(kamon_params)

    if @kamon.save
      redirect_to [:rayadmin, @kamon], notice: 'Kamon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /kamons/1
  def update
    if @kamon.update(kamon_params)
      redirect_to [:rayadmin, @kamon], notice: 'Kamon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kamons/1
  def destroy
    @kamon.destroy
    redirect_to rayadmin_kamons_url, notice: 'Kamon was successfully destroyed.'
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kamon
      @kamon = Kamon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kamon_params
      params.require(:kamon).permit(:title, :discription, :kamonpic, :kamonpic_cache, :tag_list)
    end
    def set_kamon_tags_to_gon
      gon.kamon_tags = @kamon.tag_list
    end
    def set_available_tags_to_gon
      gon.available_tags = Kamon.tags_on(:tags).pluck(:name)
    end
end
