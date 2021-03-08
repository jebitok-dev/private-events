class UsersController < ApplicationController
  before_action :require_login, only:[:new, :create, :show]
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
      redirect_to @user
    else
      render :new
    end
  end

  def sign_in
    @user = User.find_by(name: params[:name])

    if @user
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to @user, notice: 'You have successfully signed in'
    else
      render :log_in, alert: 'User does not exist'
    end
  end

  def log_out
    session.delete(:id)
    session.delete(:name)
    redirect_to root_path, notice: 'You have successfully logged out'
  end

  private
    def require_login

    end

    def user_params
      params.require(:user).permit(:name)
    end
end
