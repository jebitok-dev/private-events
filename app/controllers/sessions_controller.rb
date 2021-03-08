class SessionsController < ApplicationController
    skip_before_action :require_login, only: %i[new create delete]
  
    def new
      redirect_to user_path(current_user) if current_user
    end
  
    def create
      user = User.find_by(name: params[:session][:name])
      if user
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash.now[:info] = 'User not found. Try again.'
        render 'new'
      end
    end