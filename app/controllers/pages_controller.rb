class PagesController < ApplicationController
  def user_profile
    @current_user = current_user
  end
end
