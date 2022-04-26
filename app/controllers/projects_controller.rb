class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :userprojects ]

  def index
    @user_selected = params[:user_id].to_i

    @projects = Project.where(user: @user_selected)
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
    @project_type_values = projecttype(params["project"]["project_type"])
    @project.project_type = @project_type_values
    @used_techno_values = usedtechno(params["project"]["used_techno"])
    @project.used_techno = @used_techno_values
    @project.save!
    redirect_to user_projects_path(current_user)
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
    redirect_to user_projects_path
  end

    private

  def projecttype(project_type_values)
    resultat = project_type_values.join(",")
    resultat[1..-1]
  end

  def usedtechno(used_techno_values)
    resultat = used_techno_values.join(",")
    resultat[1..-1]
  end

    def project_params
      params.require(:project).permit(:name, :project_type, :description, :date_of_publication, :used_techno, :link, :user_id, :image )
    end
end
