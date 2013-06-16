module Authentication

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def authenticate_user(info)
    p "i would love it"
    @user = User.find_by_email(info[:email])
    if @user && @user.authenticate(info[:password])
      p "did i get here?"
      session[:id] = @user.id
      p @user
      redirect_to user_path(@user)
    else
      flash[:notice] = "Login Information Incorrect"
      redirect_to root_path
    end
  end
end


