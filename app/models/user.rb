class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories

  def value_in_mounth
    categories.map { _1.costs.where('value < ?', 0)
                             .where('created_at > ?', Time.now.beginning_of_month).sum(:value) }.sum
    
  end

  def total_amount
    categories.map { _1.costs.where('value < ?', 0).sum(:value) }.sum
  end

  def add_basic_category
    categories.create(name: 'none', description: 'Categroy for costs without category')
    categories.create(name: 'up balance', description: 'Categroy for up balance')
  end

end
