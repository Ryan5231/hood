class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @choice =Choice.new
  end
end
