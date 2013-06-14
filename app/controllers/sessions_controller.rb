class SessionsController < ApplicationController
  
  def create
    authenticate_user(params[:user])
  end

  def destroy
    session.clear
  end

end
