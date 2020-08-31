class UsersController < ApplicationController
  def index
    @users = User.left_joins(:users_departments)
               .order(:department_id)
  end

  def show
    @user = User.find(params[:id])
  end
end