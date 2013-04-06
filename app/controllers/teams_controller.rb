class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @projects = @team.projects
    @users = @team.users
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to teams_url
    else
      flash.now["notice"] = @team.errors.full_messages
      render :index
    end
  end
end
