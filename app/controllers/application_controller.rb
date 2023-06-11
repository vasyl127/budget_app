class ApplicationController < ActionController::Base
  include Internationalization
  before_action :authenticate_user!
end
