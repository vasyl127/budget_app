class PagesController < ApplicationController
  def user_profile; end

  def test
    @categories = Category.all
    @category = Category.first
  end
end
