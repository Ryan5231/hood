class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @hood = Neighborhood.find(params[:neighborhood])
    @user.neighborhoods << @hood
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      p @user.errors.full_messages
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    p user
    p "here bro????????????????????"
    user.update_attributes(username: 'ran', email: 'ran@aol.com')
      redirect_to user
    # else
    #   p "yes im here ______________________________"
    #   redirect_to edit_user_path(@user)
    # end
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

end
