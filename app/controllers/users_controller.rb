class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to @user, notice: 'You have successfully signed up'
    else
      render :new, alert: 'Name has alraedy been taken'
    end
  end

  def show
    @user = User.find(params[:id])
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

  def log_in; end

  def log_out
    session.delete(:id)
    session.delete(:name)
    redirect_to root_path, notice: 'You have successfully logged out'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
