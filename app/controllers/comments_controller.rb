class CommentsController < ApplicationController

  def new
    @listing = Listing.find(params[:id])
    @comment = Comment.new
  end

  def create
    comment = Comment.create(params[:comment])
    redirect_to listing_path(comment.listing)
  end

end
