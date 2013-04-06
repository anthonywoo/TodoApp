class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    if @user.save
      redirect_to user_url(@user)
    else
      # REV: nice use of flash, you could also use it to
      # indicate a successful save with flash["success"]
      # i think
      flash.now["notice"] = @user.errors.full_messages
      render :edit
    end
  end

  def create
    @user = User.new
    @user.attributes = params[:user]
    if @user.save
      redirect_to users_url
    else
      flash.now["notice"] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

end
