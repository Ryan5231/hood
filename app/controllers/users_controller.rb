class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if params[:neighborhood]
     @hood = Neighborhood.find(params[:neighborhood])
     p "---------------------------"
     p @hood
      @user.neighborhoods << @hood
      if @user.save
      session[:id] = @user.id
      redirect_to @user
      else
      @errors = @user.errors.full_messages
      @neighborhoods = Neighborhood.all
      render '/welcome/index', :layout => 'welcome'
      end
    else
      @neighborhoods = Neighborhood.all
      @errors = ["You must select a neighborhood"]
      render '/welcome/index', :layout => 'welcome'
    end
  end

  def edit
    @user = User.find(params[:id])
    @neighborhoods = Neighborhood.all
  end

  def update
    user = User.find(params[:id])
    @hood = Neighborhood.find(params[:neighborhood])
    user.neighborhoods.destroy_all
    user.neighborhoods << @hood
    if user.update_attributes(params[:neighbor])
      redirect_to user
    else
      redirect_to edit_user_path(@user)
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def add_photo
    @user = User.find(params[:id])
    if params[:realtor]
      @user.update_attributes(params[:realtor])
    elsif params[:neighbor]
      @user.update_attributes(params[:neighbor])
    else 
      puts "NOT A REALTOR OR NEIGHBOR"
    end    
    redirect_to @user
  end

end
