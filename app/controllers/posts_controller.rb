class PostsController < ApplicationController

  def new
    @listing = Listing.find(params[:id])
    @post = Post.new
  end

  def create
    post = Post.create(params[:post])
    redirect_to listing_path(post.listing)
  end

end