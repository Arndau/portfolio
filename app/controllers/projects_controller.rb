class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @projects = Project.all
  end

  def userprojects
    # @userprojects = @projects.where(user.id == @user.id)
    @projects = Project.all
    # @userprojects = @projects.where(user_id: @user.id)
    # @userprojects = Project.find(params[:id])
    @userprojects = @projects.where(user: @user)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Restaurant.new(params[:restaurant])
    @project.save
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(params[:project])
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

    private

    def project_params
      params.require(:project).permit(:name, :type, :description, :date_of_publication, :used_techno, :link, :user_id)
    end
end
