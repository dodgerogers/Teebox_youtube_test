class StaticPagesController < ApplicationController
  
  def home
    @users = User.all
  end
  
  def youtube
  end
end