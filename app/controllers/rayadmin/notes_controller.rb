class Rayadmin::NotesController < Rayadmin::RayadminController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    # @user = User.find(params[:id])
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to rayadmin_note_path(@note)
    else
      render 'new'
    end
    
  end

  def update
      if @note.update(note_params)
        redirect_to [:rayadmin, @note], notice: 'Note was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @note.destroy
      redirect_to rayadmin_notes_path, notice: 'Note was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :content, :user_id)
    end
end
