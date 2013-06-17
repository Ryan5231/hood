class ChoicesController < ApplicationController
  def create
    @choice = Choice.new(params[:choice])
    @choice.neighbor = current_user
    if @choice.save
      render :json => {:choice => @choice, :path => vote_choice_path(@choice)}
    else
      # do something here
    end
  end

  def vote
    p params
    @choice = Choice.find(params[:id])
    vote = Vote.create(choice_id: @choice.id, neighbor_id: current_user.id)
    render :json => {:choice => @choice, :votes => @choice.vote_count}
  end
end
