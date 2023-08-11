class DashboardController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 2)
  end
end
