class SessionController < ApplicationController
  def new # get log in form
  end

  def create # take login form data
    user = User.find_by :email => params[:email] # put user params into variable
    if user.present? && user.authenticate(params[:password]) # check for match via bcrypt
      session[:user_id] = user.id # remember the user between pages
      redirect_to root_path # match redirect
    else
      redirect_to login_path # no match redirect
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
