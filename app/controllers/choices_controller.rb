class ChoicesController < ApplicationController
  def create
    @choice = Choice.new(params[:choice])
    if @choice.save
      redirect_to show_listing_path(@choice.listing)
    else
      # do something here
    end
  end

  def vote
    p params
  end
end
