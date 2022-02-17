class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  # -----complete task only-----
  def user_reports
    status = 10
    type_user = current_user.id
    @tasks = Task.where(user_id: type_user, status: status)
  end

end
