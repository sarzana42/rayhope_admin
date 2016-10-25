class Rayadmin::SessionsController < Rayadmin::RayadminController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "#{@user.name}として、ログインしました。"
      redirect_to [:rayadmin, @user]
    else
      flash[:danger] = "メールアドレスかパスワードが一致しません"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to rayadmin_login_path
  end
  
end
