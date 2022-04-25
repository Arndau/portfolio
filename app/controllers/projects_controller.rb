class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :userprojects ]

  def index
    @projects = Project.all
  end

  def userprojects
    @user = User.all
    @projects = Project.all
    @userprojects = @projects.where(user: @user)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user=current_user
    @project.save!
    redirect_to userprojects_projects_path
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
      params.require(:project).permit(:name, :project_type, :description, :date_of_publication, :used_techno, :link, :user_id, :image)
    end
end
