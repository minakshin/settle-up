# Expense model
class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  def user_expense(user)
    find_by(user_id: user)
  end
end
