class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :costs, dependent: :destroy
end
