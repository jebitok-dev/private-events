class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    return unless @user

    @created_events = @user.events
    @previous_events = @user.attended_event.where('date < (?) ', Date.today)
    @upcoming_events = @user.attended_event.where('date >= (?)', Date.today)
  end

  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:info] = 'The user was saved successfully.'
      redirect_to sign_in_path
    else
      flash[:info] = @user.errors.full_messaes
      render :new
    end
  end

  private

  def require_login; end

  def user_params
    params.require(:user).permit(:name)
  end
end
