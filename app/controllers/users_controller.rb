class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account successfully updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if !current_user_admin?
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit!
    end

    def require_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user) || current_user_admin?
    end
  # private end
end