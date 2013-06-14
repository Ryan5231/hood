class WelcomeController < ApplicationController
  def index
    @user = User.new
    render :layout => 'welcome'
  end
end
