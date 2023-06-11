# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :costs, dependent: :destroy

  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories

  def total_amount
    costs.sum(:value)
  end

  def basic_category?
    name == 'none' || name == 'up balance'
  end
end
