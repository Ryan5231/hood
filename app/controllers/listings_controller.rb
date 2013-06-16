class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @hood = @listing.neighborhood
    @choice =Choice.new
  end

  def new
    @listing = Listing.new
    @neighborhoods = Neighborhood.all
  end

  def create
    @hood = Neighborhood.find(params[:neighborhood])
    @listing = Listing.new(title: params[:listing][:title],
                           description: params[:listing][:description],
                           address: params[:listing][:address],
                           neighborhood_id: @hood.id,
                           realtor_id: current_user.id)
    if @listing.save
      redirect_to @listing
    else
      flash[:listing_error] = "Please fill out all fields"
      redirect_to new_listing_path
    end

  end

end
