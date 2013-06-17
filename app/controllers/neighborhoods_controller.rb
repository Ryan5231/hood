class NeighborhoodsController < ApplicationController
  def show
    @hood = Neighborhood.find(params[:id])
    @listings = Listing.where('neighborhood_id=? AND status=?', @hood.id, 'active')
  end
end
