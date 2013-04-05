class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @team = @project.team
  end

  def new
    @project = Project.new
    @project.team_id = params[:team_id]
  end

  def create
    @project = Project.create!(params[:project])
    redirect_to projects_url
  end

end
