class ProfilesController < ApplicationController
  respond_to :html, :xml
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to profile_path
    else
      render :action => :edit
    end
  end
  
end
