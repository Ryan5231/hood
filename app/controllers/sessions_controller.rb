class SessionsController < ApplicationController
  
  def create
    authenticate_user(params["user"])
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
