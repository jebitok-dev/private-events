class UsersController < ApplicationController
  before_action :require_login, only:[:new, :create, :show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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

  private
    def require_login

    end

    def user_params
      params.require(:user).permit(:name)
    end
end
