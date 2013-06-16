class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @hood = @listing.neighborhood
    @choice =Choice.new
  end
end
