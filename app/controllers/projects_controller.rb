class ProjectsController < ApplicationController
  # GET /projects
  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private


  def project_params
    params.require(:project).permit(:title)
  end
end
