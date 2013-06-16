class SessionsController < ApplicationController
  
  def create
    authenticate_user(params["user"])
    p "what about here? did you get here?"
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
