class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter do
    raise CanCan::AccessDenied unless current_user and current_user.admin?
  end
 
  def index
    @users = User.all
    respond_with @users
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.create(params[:user])
    respond_with @user, :location => users_path
  end

  def edit
    @user = User.find params[:id]
    respond_with @user
  end
  
  def show
    @user = User.find params[:id]
    respond_with @user
  end

  def update
    if params[:user] && params[:user][:password].blank?
      params[:user].delete(:password) 
      params[:user].delete(:password_confirmation)
    end
    @user = User.find params[:id]
    @user.update_attributes(params[:user])
    respond_with @user, :location => users_path
  end

  def destroy
    @user = User.find params[:id]
    unless @user.destroy
      flash[:error] = @user.errors.full_messages.join
    end
    redirect_to :action => :index
  end
end
