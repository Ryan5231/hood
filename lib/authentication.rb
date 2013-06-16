module Authentication

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def authenticate_user(info)
    p "here bro?"
    p info
    p "yes bro"
    p info[:email]
    @user = User.find_by_email(info[:email])
    if @user && @user.authenticate(info[:password])
      p "i thought i was gonna be over there"
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      p "yes, i know this is wrong"
      flash[:notice] = "Login Information Incorrect"
      redirect_to root_path
    end
  end
end
