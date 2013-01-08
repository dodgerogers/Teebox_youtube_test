class UsersController < ApplicationController
  
  private
  
  def index
    @users = User.all
  end
end