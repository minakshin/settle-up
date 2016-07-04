# Reports controller
class ReportsController < ApplicationController
  def index
    @team = current_user.teams
    @expense = current_user.calculate_total_expnese
  end
end
