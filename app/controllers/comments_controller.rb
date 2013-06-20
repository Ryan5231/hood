class CommentsController < ApplicationController

  def new
    @listing = Listing.find(params[:id])
    @comment = Comment.new
  end

  def create
    comment = Comment.create(params[:comment])
    puts "***************I GOT HERE******************************"
    render :json => {:comment => comment, 
    									:image_url => comment.user.image_url(:mini)}
    									puts " ++++++++++++++++AND HERE++++++++++++"

  end

end
