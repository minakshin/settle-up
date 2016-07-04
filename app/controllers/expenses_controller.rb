# Expense controller
class ExpensesController < ApplicationController
  before_filter :expense_params, only: :create
  before_action :user_teams, only: [:new]

  def index
    @expenses = current_user.expenses
  end

  def show
    @expense = Expense.find(params[:id])
    @team = @expense.team
  end

  def new
    @expense = current_user.expenses.build
  end

  def create
    expense = current_user.expenses.build(expense_params)
    if expense.save
      redirect_to expenses_path
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:reason, :amount, :team_id)
  end

  def user_teams
    @teams = current_user.teams
  end
end
