class WelcomeController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all
    @user = User.new
    render :layout => 'welcome'
  end

end
