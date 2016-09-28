class Rayadmin::AdminsController < Rayadmin::RayadminController
  def home
    if not logged_in?
      redirect_to rayadmin_login_path
    end
  end
end
