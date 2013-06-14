class ChoicesController < ApplicationController
  def create
    @choice = Choice.new(params[:choice])
    @choice.neighbor = current_user
    if @choice.save
      redirect_to @choice.listing
    else
      # do something here
    end
  end

  def vote
    @choice = Choice.find(params[:id])
    vote = Vote.create(choice_id: @choice.id, neighbor_id: current_user.id)
    redirect_to  @choice.listing
  end
end
