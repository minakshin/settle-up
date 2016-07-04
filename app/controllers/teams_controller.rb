# Teams pController
class TeamsController < ApplicationController
  before_filter :team_params, only: [:create, :update]
  before_filter :find_team, only: [:show, :edit, :update]

  def index
    @teams = Team.all
  end

  def show
    @team_users = @team.users
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def update
    byebug
    if @team.update(team_params)
      flash[:success] = 'Team member added successfully!'
    else
      flash[:danger] = 'Error!'
    end
    redirect_to teams_path
  end

  def create
    team = Team.new(team_params)
    if team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
