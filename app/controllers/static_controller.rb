class StaticController < ApplicationController
  
  def home
    @videos ||= Video.all
  end
end