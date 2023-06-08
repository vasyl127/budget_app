class Cost < ApplicationRecord
  after_create :upd_user_balance_after_create
  after_destroy :upd_user_balance_after_destroy

  belongs_to :category

  def upd_user_balance_after_create
    user = User.find(user_id)

    balance = user.balance
    user.update(balance: balance + value)
  end

  def upd_user_balance_after_destroy
    user = User.find(user_id)

    balance = user.balance
    user.update(balance: balance - value)
  end

  def user_for_cost
    User.joins(user_categories: { category: :costs }).where(costs: { id: id })
  end
end
