class ApplicationController < ActionController::Base
  before_action :fetch_user
  # this will be anctioned on every page/action because they inherit from here
  private
  def fetch_user # TODO test this with both find and by Id in console
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present? # Log out non-existant users
  end
end
