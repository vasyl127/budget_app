class PagesController < ApplicationController
  def test
    @categories = Category.all
    @category = Category.first
  end

  def user_profile
    @current_user = current_user
  end
end
