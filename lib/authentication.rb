module Authentication

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def authenticate_user(info)
    @user = User.find_by_email(info[:email])
    if @user && @user.authenticate(info[:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Login Information Incorrect. Please Try Again."
      redirect_to root_path
    end
  end
end


