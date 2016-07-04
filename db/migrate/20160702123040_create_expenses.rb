class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :amount, null: false
      t.string :reason, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :team, index: true, null: false
      t.timestamps null: false
    end
  end
end
