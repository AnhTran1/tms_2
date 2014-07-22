module SessionsHelper
  def sign_in(trainee)
    remember_token = Trainee.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    trainee.not_validates_password = true
    trainee.update_attributes! remember_token: Trainee.digest(remember_token)
    self.current_trainee = trainee

  end
 
  def signed_in?
    !current_trainee.nil?
  end
  def current_trainee=(trainee)
    @current_trainee = trainee
  end
  def current_trainee?(trainee)
    trainee == current_trainee
  end
  
  def current_trainee
    remember_token = Trainee.digest(cookies[:remember_token])
    @current_trainee ||= Trainee.find_by(remember_token: remember_token)
  end
  
  def sign_out
    current_trainee.update_attribute(:remember_token,
    Trainee.digest(Trainee.new_remember_token))
    cookies.delete(:remember_token)
    self.current_trainee = nil
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  def store_location
    session[:return_to] = request.url
  end
  def signed_in_trainee
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
    def be_trainee? trainee
    trainee.supervisor == 0
  end
  def supervisor_trainee? trainee
    trainee.supervisor > 0
  end
  def supervisor_trainee
    redirect_to(root_url) unless current_trainee.supervisor == 1
  end
  def be_trainee
    redirect_to(root_url) unless current_trainee.supervisor == 0
  end
end
