class UsersController < ApplicationController
  
  before_filter :get_user, only: [:show, :edit, :update]
  
  def get_user
    @user = User.find(params[:id])
  end
  
  def show
    @videos = @user.videos
  end
  
  def index
    @users = User.all
  end
  
  def edit
  end
  
  def update
      if @user.update_attributes(params[:user])
        redirect_to @user, notice: "User updated successfully" 
      else
        render :edit
      end
  end

  private
  
  def destroy
  end
end