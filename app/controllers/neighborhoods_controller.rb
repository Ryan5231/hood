class NeighborhoodsController < ApplicationController
  def show
    @hood = Neighborhood.find(params[:id])
  end
end
