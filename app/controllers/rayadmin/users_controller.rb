class Rayadmin::UsersController < Rayadmin::RayadminController
  def index
    # @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    # file = params[:user][:image]
      # @user.set_image(file)
    
     if @user.save
       flash[:success] = "Welcome to the Sample App!"
       redirect_to [:rayadmin, @user]
     else
       render 'new'
     end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
        @user = User.find params[:id]
        # @user.set_image(file)
        if @user.update(user_params)
            redirect_to [:rayadmin, @user]
        else
            render 'edit'
        end
  end
    def destroy
        @user = User.find params[:id]
        @user.destroy
        redirect_to rayadmin_users_path, notice: '削除しました。'
    end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
