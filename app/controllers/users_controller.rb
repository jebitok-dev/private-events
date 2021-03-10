class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:info] = 'The user was saved successfully.'
      redirect_to sign_in_path
    else
      flash[:info] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    return unless @user

    @created_events = @user.events
    @previous_events = @user.attended_event.where('date < (?) ', Date.today)
    @upcoming_events = @user.attended_event.where('date >= (?)', Date.today)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
