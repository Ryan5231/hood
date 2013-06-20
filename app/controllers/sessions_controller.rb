class SessionsController < ApplicationController

  def create
    authenticate_user(params["user"])
  end

  def destroy
    session.clear
    redirect_to out_path
  end

  def out
    render :layout => false
  end

end
