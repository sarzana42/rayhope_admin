class Rayadmin::AdminsController < RayadminsController
  def home
    if not logged_in?
      redirect_to login_path
    end
  end
end
