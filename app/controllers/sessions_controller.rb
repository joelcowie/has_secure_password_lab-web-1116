class SessionsController < ApplicationController

  def new
  end

  def create
    if !User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
      redirect_to '/login'
    else
      user = User.find_by(name: params[:user][:name])
      session[:user_id] = user.id
      redirect_to '/'
    end
  end

end
