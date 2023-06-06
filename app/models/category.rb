class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
  has_many :costs, dependent: :destroy

  def total_amount
    costs.sum(:value)
  end
end
