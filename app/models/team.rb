# Team model
class Team < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :users_teams
  has_many :expenses

  def users_list
    User.all.reject { |user| users.include?(user) }
  end
end
