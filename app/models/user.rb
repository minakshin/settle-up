# User model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :teams, join_table: :users_teams
  has_many :expenses

  def expense(team)
    team.expenses.where(user_id: id).sum(:amount)
  end

  def calculate_total_expnese
    byebug
  end

end
