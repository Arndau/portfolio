class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end
  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :description, :facebook, :instagram, :twitter, :linkedin, :phone_number, :country, :birth_date, :job_title, :id)
  end

end
