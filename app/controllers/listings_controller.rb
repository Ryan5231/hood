class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @hood = @listing.neighborhood
    @choice =Choice.new
    @comment =Comment.new
  end

  def new
    @listing = Listing.new
    @neighborhoods = Neighborhood.all
  end

  def create
    if params[:neighborhood]
      @hood = Neighborhood.find(params[:neighborhood]).first
      p @hood
    else
      @hood = Neighborhood.find_or_create_by_name(params[:neighborhood_name])
      p @hood
    end
    @listing = Listing.new(params[:listing])
    @listing.neighborhood = @hood
    @listing.realtor_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      flash[:listing_error] = "Please fill out all fields"
      redirect_to new_listing_path
    end

  end

  def edit
    @neighborhoods = Neighborhood.all
    @listing = Listing.find(params[:id])
    @hood = @listing.neighborhood
  end

  def update
    @listing = Listing.find(params[:id])
    p params
    @listing.update_attributes(params[:listing])
    redirect_to listing_path(@listing)
  end

  def close
    @listing = Listing.find(params[:id])
    @listing.status = 'inactive'
    @listing.save
    redirect_to user_path(@listing.realtor)
  end

  def reopen
    @listing = Listing.find(params[:id])
    @listing.status = 'active'
    @listing.save
    redirect_to listing_path(@listing)
  end

end
