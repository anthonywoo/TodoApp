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
    @team = Team.create!(params[:team])
    redirect_to teams_url
  end
end
