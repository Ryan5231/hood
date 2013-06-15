class WelcomeController < ApplicationController
  def index
    @user = User.new
    render :layout => 'welcome'
  end

  def temp_slider
    render :temp_slider
  end
end
