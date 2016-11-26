class Rayadmin::PerformsController < Rayadmin::RayadminController
  before_action :set_perform, only: [:show, :edit, :update, :destroy]
  before_action :set_perform_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit]

  # GET /performs
  def index
    @performs = params[:tag].present? ? Perform.tagged_with(params[:tag]) : Perform.all
    @performs = @performs.all.includes(:tags)
  end

  # GET /performs/1
  def show
  end

  # GET /performs/new
  def new
    @perform = Perform.new
  end

  # GET /performs/1/edit
  def edit
  end

  # POST /performs
  def create
    @perform = Perform.new(perform_params)

    if @perform.save
      redirect_to [:rayadmin, @perform], notice: 'Perform was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /performs/1
  def update
    if @perform.update(perform_params)
      redirect_to [:rayadmin, @perform], notice: 'Perform was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /performs/1
  def destroy
    @perform.destroy
    redirect_to rayadmin_performs_url, notice: 'Perform was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perform
      @perform = Perform.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def perform_params
      params.require(:perform).permit(:title, :description, :performimage, :performimage_cache, :tag_list)
    end
    
    def set_perform_tags_to_gon
      gon.perform_tags = @perform.tag_list
    end
    def set_available_tags_to_gon
      gon.available_tags = Perform.tags_on(:tags).pluck(:name)
    end
    
end
