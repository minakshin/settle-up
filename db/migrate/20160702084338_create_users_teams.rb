# create join table for team and users
class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams, id: false do |t|
      t.integer :user_id, null: false
      t.integer :team_id, null: false
      t.index [:user_id, :team_id], unique: true
    end
  end
end
