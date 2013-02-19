class Question < ActiveRecord::Base
  
  attr_accessible :title, :body, :user_id
    
  belongs_to :user  
  validates_presence_of :title, :body, :user_id
end
