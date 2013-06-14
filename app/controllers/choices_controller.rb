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
    p current_user
    @choice = Choice.find(params[:choice].to_s)
    vote = Vote.create(choice_id: @choice.id)
  end
end
